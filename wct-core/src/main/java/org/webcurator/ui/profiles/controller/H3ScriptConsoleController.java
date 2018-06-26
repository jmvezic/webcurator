/*
 *  Copyright 2006 The National Library of New Zealand
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package org.webcurator.ui.profiles.controller;

import javafx.util.Pair;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;
import org.webcurator.auth.AuthorityManager;
import org.webcurator.core.harvester.agent.HarvestAgent;
import org.webcurator.core.harvester.agent.HarvestAgentScriptResult;
import org.webcurator.core.scheduler.TargetInstanceManager;
import org.webcurator.domain.model.auth.Privilege;
import org.webcurator.domain.model.core.TargetInstance;
import org.webcurator.ui.common.CommonViews;
import org.webcurator.ui.common.Constants;
import org.webcurator.ui.profiles.command.H3ScriptConsoleCommand;
import org.webcurator.ui.util.HarvestAgentUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Controller to handle users viewing profiles.
 * @author bbeaumont
 *
 */
public class H3ScriptConsoleController extends AbstractCommandController {
	/** The profile manager to load the profile */
	private TargetInstanceManager targetInstanceManager = null;
	/** The authority manager for checking permissions */
	private AuthorityManager authorityManager = null;
	/**
	 * The name of the h3 scripts directory.
	 */
	private String h3ScriptsDirectory = "";

	/** Logger for the H3ScriptConsoleController. **/
	private static Log log = LogFactory.getLog(H3ScriptConsoleController.class);

	private static Map<String, String> fileExtensionToScriptType = new HashMap<String, String>();

	static {
		fileExtensionToScriptType.put("bsh", "beanshell");
		fileExtensionToScriptType.put("groovy", "groovy");
		fileExtensionToScriptType.put("js", "nashorn");
	}

	/**
	 * Construct a new ProfileViewController.
	 */
	public H3ScriptConsoleController() {
		setCommandClass(H3ScriptConsoleCommand.class);
	}

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.mvc.AbstractCommandController#handle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.validation.BindException)
	 */
	@Override
	protected ModelAndView handle(HttpServletRequest req, HttpServletResponse res, Object comm, BindException errors) throws Exception {
		H3ScriptConsoleCommand command = (H3ScriptConsoleCommand) comm;
		TargetInstance ti = targetInstanceManager.getTargetInstance(command.getTargetInstanceOid(), true);
		String result = "";
		// Retrieve the list of script files and the contents
		Map<Pair<String, String>, String> scripts = getScripts();
		// Set default selected script
		String selectedScript = command.getScriptSelected();
		if (selectedScript == null || selectedScript.equals("")) {
			command.setScriptSelected("none");
		}

		if (authorityManager.hasAtLeastOnePrivilege(ti.getProfile(), new String[] {Privilege.MANAGE_TARGET_INSTANCES, Privilege.MANAGE_WEB_HARVESTER})) {
			if (req.getMethod().equals("POST") && ti.getState().equals("Running")
					&& command.getActionCommand().equals(H3ScriptConsoleCommand.ACTION_EXECUTE_SCRIPT)) {
				// Run the heritrix 3 script - only if the status is still running
				HarvestAgent ha = getHarvestAgent();
				HarvestAgentScriptResult scriptResult = ha.executeShellScript(Long.toString(command.getTargetInstanceOid()), command.getScriptEngine(), command.getScript());
				result = scriptResult.toString();
			}
			ModelAndView mav = new ModelAndView("h3-script-console");
			mav.addObject("targetInstance", ti);
			mav.addObject("scripts", scripts);
			mav.addObject("result", result);
			mav.addObject(Constants.GBL_CMD_DATA, command);
			return mav;
		}
		else { 
			return CommonViews.AUTHORISATION_FAILURE;
		}
	}

	private String getScriptFromFile(File file) {
		String lineSep = System.getProperty("line.separator");
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		FileReader fr = null;
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line);
				//sb.append(lineSep);
			}
		} catch (IOException e) {
			log.error(e);
		} finally {
			try {
				if (br != null) {
					br.close();
				}
				if (fr != null) {
					fr.close();
				}
			} catch (IOException ex) {
				log.error(ex);
			}
		}
		return sb.toString();
	}

	/**
	 * This method returns a map containing a Pair as the key and a String as the value.
	 * The Pair contains the script's file name as the key and the script type (beanshell, groovy, nashorn)
	 * as the value.
	 * The contents of the script file are the map's value.
	 * @return the map.
	 */
	private Map<Pair<String, String>, String> getScripts() {
		final List<String> validFileExtensions = Arrays.asList("bsh", "groovy", "js");
		Map<Pair<String, String>, String> scripts = new HashMap<Pair<String, String>, String>();
		// Get list of valid files in directory
		File scriptDirectory = new File(h3ScriptsDirectory);
		File[] scriptFiles = scriptDirectory.listFiles(new FilenameFilter() {
			@Override
			public boolean accept(File dir, String name) {
				String ext = FilenameUtils.getExtension(name);
				return ext != null && validFileExtensions.contains(ext);
			}
		});

		for (File scriptFile : scriptFiles) {
			// Parse file name into script name and type
			String scriptName = FilenameUtils.removeExtension(scriptFile.getName());
			String scriptExt = FilenameUtils.getExtension(scriptFile.getName());
			String scriptType = fileExtensionToScriptType.get(scriptExt);
			// Read file contents into script
			String script = getScriptFromFile(scriptFile);
			// Put into map
			Pair<String, String> scriptPair = createScriptPair(scriptName, scriptType);
			scripts.put(scriptPair, script);
		}
		return scripts;
	}

	private Pair<String, String> createScriptPair(String scriptName, String scriptType) {
		Pair<String, String> pair = new Pair<String, String>(scriptName, scriptType);
		return pair;
	}

	/**
	 * @return Returns the targetInstanceManager.
	 */
	public TargetInstanceManager getTargetInstanceManager() {
		return targetInstanceManager;
	}

	/**
	 * @param targetInstanceManager The targetInstanceManager to set.
	 */
	public void setTargetInstanceManager(TargetInstanceManager targetInstanceManager) {
		this.targetInstanceManager = targetInstanceManager;
	}

	/**
	 * @param authorityManager The authorityManager to set.
	 */
	public void setAuthorityManager(AuthorityManager authorityManager) {
		this.authorityManager = authorityManager;
	}

	/**
	 * @param h3ScriptsDirectory The h3ScriptsDirectory to set.
	 */
	public void setH3ScriptsDirectory(String h3ScriptsDirectory) {
		this.h3ScriptsDirectory = h3ScriptsDirectory;
	}

	/**
	 *
	 * @return The first available H3 HarvestAgent instance that we can find.
	 */
	private HarvestAgent getHarvestAgent() {

		return HarvestAgentUtil.getHarvestAgent(getApplicationContext());
	}

}

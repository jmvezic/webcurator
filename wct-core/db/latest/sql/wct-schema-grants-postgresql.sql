GRANT SELECT, INSERT, UPDATE ON DB_WCT.ID_GENERATOR TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.WCTUSER TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.WCTROLE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE ON DB_WCT.ROLE_PRIVILEGE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.USER_ROLE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.HARVEST_RESOURCE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ARC_HARVEST_RESOURCE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.HARVEST_RESULT TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ARC_HARVEST_RESULT TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ARC_HARVEST_FILE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.TARGET_INSTANCE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.BANDWIDTH_RESTRICTIONS TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.TARGET_INSTANCE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.SCHEDULE TO USR_WCT;
GRANT SELECT, INSERT ON DB_WCT.WCTAUDIT TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.AGENCY TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.SEED TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.SEED_HISTORY TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.SEED_PERMISSION TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PROFILE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE ON DB_WCT.HARVEST_STATUS TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.SITE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.URL_PATTERN TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.AUTHORISING_AGENT TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PERMISSION TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PERMISSION_EXCLUSION TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PERMISSION_URLPATTERN TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.URL_PERMISSION_MAPPING TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ANNOTATIONS TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PROFILE_OVERRIDES TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PO_INCLUSION_URI TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PO_EXCLUSION_URI TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PROFILE_FORM_CREDENTIALS TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PROFILE_CREDENTIALS TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PROFILE_BASIC_CREDENTIALS TO USR_WCT;
GRANT SELECT, INSERT, DELETE ON DB_WCT.NOTIFICATION TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.TASK TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.WCT_LOGON_DURATION TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ABSTRACT_TARGET TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.TARGET_GROUP TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.TARGET TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.GROUP_MEMBER TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PERMISSION_TEMPLATE TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.SITE_AUTH_AGENCY TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.DUBLIN_CORE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.HR_MODIFICATION_NOTE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.HR_MODIFICATION_NOTE TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.TARGET_INSTANCE_ORIG_SEED TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.SIP_PART_ELEMENT TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.URL_PERMISSION_MAPPING_VIEW TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.ABSTRACT_TARGET_SCHEDULE_VIEW TO USR_WCT;
GRANT SELECT, UPDATE, INSERT, DELETE ON DB_WCT.ABSTRACT_TARGET_GROUPTYPE_VIEW TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.REJECTION_REASON TO USR_WCT;

-- WCT 1.6 UPGRADE
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.INDICATOR TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.INDICATOR_CRITERIA TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.INDICATOR_REPORT_LINE TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.FLAG TO USR_WCT;

GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.HEATMAP_CONFIG TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.ROLE_PRIVILEGE TO USR_WCT;

GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PO_H3_BLOCK_URL TO USR_WCT;
GRANT SELECT, INSERT, UPDATE, DELETE ON DB_WCT.PO_H3_INCLUDE_URL TO USR_WCT;

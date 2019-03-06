/**
 * installer
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false persistent=false extends="com.easyxms.application.base" {

		function getDB() {
			return getService("DB");
		}

		function init() {

			_cnt_types_min = 3;
			_cnt_roles_min = 1;
			_cnt_users_min = 1;
			_cnt_publs_min = 1;
			_cnt_cntxt_min = 1;
			_cnt_langs_min = 1;
			_cnt_atoms_min = 6;
			_cnt_attrs_min = 1;
			_cnt_conns_min = 1;
			
			if (Application.EasyXMS.getInstall() and !isSetup()) {
				setup();
			}
			return this;
		}

		boolean function isSetup() {

			if (checkTypes() and checkAtoms() and checkRoles() and checkUsers() and checkAttrs() and checkConns() and checkCntxt())
				return true;
			else
				return false;
		}

		function setup() {

			transaction action="begin";

			if (!checkRoles())
				addRoles();

			if (!checkUsers())
				addUsers();

			if (!checkLangs())
				addLangs();

			if (!checkPubls())
				addPubls();

			if (!checkTypes())
				addTypes();

			if (!checkCntxt())
				addCntxt();

			if (!checkAttrs())
				addAttrs();

			if (!checkConns())
				addConns();

			transaction action="commit";
		}

		function addnonexisting(string name, string field, any value) {
			var oData = 0;
		}

		function addAtoms() {

		}

		function addLangs() {

		}

		function addPubls() {

		}

		function addCntxt() {

		}

		function addTypes() {

			var strctData = {};
			strctData.Type_KEY = 3;
			strctData.Type_Name = "APPLICATIONS";
			strctData.Type_Description = "All Application Type";
			strctData.Type_Shortcut = "APPLS";
			strctData.Type_Created_By = 1;
			strctData.Type_Created = now();

			var strctAtom = {title=strctData.Type_Name, short=strctData.Type_Shortcut, text=strctData.Type_Description};
			getDB().addUniqueElement("TYPES", strctData, 1, 0, strctAtom);

			strctData.Type_KEY = 4;
			strctData.Type_Name = "TABLENAMES";
			strctData.Type_Description = "All Tablenames Type";
			strctData.Type_Shortcut = "TABLS";
			strctData.Type_Created_By = 1;
			strctData.Type_Created = now();
			strctAtom = {title=strctData.Type_Name, short=strctData.Type_Shortcut, text=strctData.Type_Description};
			getDB().addUniqueElement("TYPES", strctData, 1, 0, strctAtom);

			strctData.Type_KEY = 5;
			strctData.Type_Name = "FIELDS";
			strctData.Type_Description = "All Fieldname Type";
			strctData.Type_Shortcut = "FIELS";
			strctData.Type_Created_By = 1;
			strctData.Type_Created = now();
			strctAtom = {title=strctData.Type_Name, short=strctData.Type_Shortcut, text=strctData.Type_Description};
			getDB().addUniqueElement("TYPES", strctData, 1, 0, strctAtom);

		}

		function addAttrs() {

		}

		function addRoles() {
			var strctData = {};

			strctData.Type_KEY = 1;
			strctData.Type_Name = "ROLENAMES";
			strctData.Type_Description = "All Roles Type";
			strctData.Type_Shortcut = "ROLES";
			strctData.Type_Created_By = 1;
			strctData.Type_Created = now();
			strctAtom = {title=strctData.Type_Name, short=strctData.Type_Shortcut, text=strctData.Type_Description};
			getDB().addUniqueElement("TYPES", strctData, 1, 0, strctAtom);

			strctData = {};
			strctData.Role_Name = "ADMINSTRATION";
			var strctAtom = {title=strctData.Role_Name, short=strctData.Role_Name, text=strctData.Role_Name};
			getDB().addUniqueElement("ROLES", strctData, 1, 1, strctAtom);

		}

		function addUsers() {

			var strctData = {};

			strctData.Type_KEY = 2;
			strctData.Type_Name = "USERNAMES";
			strctData.Type_Description = "All Users Type";
			strctData.Type_Shortcut = "USERS";
			strctData.Type_Created_By = 1;
			strctData.Type_Created = now();
			strctAtom = {title=strctData.Type_Name, short=strctData.Type_Shortcut, text=strctData.Type_Description};
			getDB().addUniqueElement("TYPES", strctData, 1, 0, strctAtom);

			strctData = {};

			strctData.USER_Name = "ADMIN";
			//ADMIN is the default password. User has to change that
			strctData.USER_Password = encrypt("ADMIN", hash(strctData.USER_Name), "DESEDE");
			var strctAtom = {title=strctData.USER_Name, short=strctData.USER_Name, text=strctData.USER_Name};
			getDB().addUniqueElement("USERS", strctData, 1, 2, strctAtom);

		}

		function addConns() {

		}

		boolean function checkTypes() {
			try {

				var aTypes = ORMExecuteQuery("SELECT count(*) as CNT FROM TYPES");
				return (aTypes[1] gte _cnt_types_min);
			} catch (e) {

				return false;
			}
		}

		boolean function checkCntxt() {
			try {
				var aCntxt = ORMExecuteQuery("SELECT count(*) as CNT FROM CNTXT");
				return (aCntxt[1] gte _cnt_cntxt_min);
			} catch (e) {

				return false;
			}
		}

		boolean function checkAtoms() {
			try {
				var aAtoms = ORMExecuteQuery("SELECT count(*) as CNT FROM ATOMS");
				return (aAtoms[1] gte _cnt_atoms_min);
			} catch (e) {

				return false;
			}

		}

		boolean function checkRoles() {
			try {
				var aRoles = ORMExecuteQuery("SELECT count(*) as CNT FROM ROLES");
				return (aRoles[1] gte _cnt_roles_min);
			} catch (e) {

				return false;
			}
		}

		boolean function checkUsers() {
			try {
				var aUsers = ORMExecuteQuery("SELECT count(*) as CNT FROM USERS");
				return (aUsers[1] gte _cnt_users_min);
			} catch (e) {

				return false;
			}
		}

		boolean function checkLangs() {
			return false;
		}


		boolean function checkAttrs() {
			return false;
		}


		boolean function checkConns() {
			return false;
		}

		boolean function checkPubls() {
			return false;
		}
}
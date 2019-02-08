component output="false" displayname="Request" extends="com.easyxms.application.base"  {

	/* Shortcuts begin with _Easy */
	$EasyXMS = Application.EasyXMS;
    $EasyConfig = NullValue();
    $EasyModel = NullValue();
    $EasyController = NullValue();
    $EasyTemplate = NullValue();
    $EasyResult = NullValue();
    $EasyRequest = NullValue();

    function setTemplate(any oTemplate) {
		$EasyTemplate = oTemplate;
	}

	function getTemplate() {
		return $EasyTemplate;
    }

    function setConfig(any oConfig) {
		$EasyConfig = oConfig;
	}

	function getConfig() {
		return $EasyConfig;
	}

	function setModel(any oModel) {
		$EasyModel = oModel;
	}

	function getModel() {
		return $EasyModel;
	}

	function setController(any oController) {
		$EasyController = oController;
	}

	function getController() {
		return $EasyController;
    }

    function runRequest(string scriptname, struct param = {}, struct frm = {}) {
        var sResult = "";
		var sFolder = getConfig().getsetting("views");
		var sFileToInclude = sFolder & scriptname;
		getModel().setVar("__param", param);
		getModel().setVar("__frm", frm);
		var Events = getConfig().getevents();
		for (var e in Events) {
			evaluate("getController().#e#()");
        }

        if (not isNull(getTemplate())) {

            getTemplate().setModel(getModel());
            getTemplate().setController(getController());
            getTemplate().setConfig(getConfig());
            if (fileExists(expandpath(sFileToInclude)))
                sResult = getTemplate().includetemplate(sFileToInclude);
            else if (getconfig(scriptname).getsetting("show404"))
                sResult = getTemplate().includetemplate(getConfig(scriptname).get404Template());
            else
                sResult = getTemplate().includetemplate(getConfig(scriptname).getstartTemplate());
        }
		setResult(sResult);
	}

	string function setResult(string Result) {
        $EasyResult = Result;
    }

    string function getResult() {
        return $EasyResult;
    }

}
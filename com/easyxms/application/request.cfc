component output="false" displayname="Request" extends="com.easyxms.application.base"  {

	/* Shortcuts begin with _Easy */
	$EasyXMS = Application.EasyXMS;
    $EasyConfig = NullValue();
    $EasyModel = NullValue();
    $EasyController = NullValue();
    $EasyPresenter = NullValue();
    $EasyResult = NullValue();
    $EasyRequest = this;
    $EasyData = structNew();

    function setPresenter(any oPresenter) {
		$EasyPresenter = oPresenter;
	}

	function getPresenter() {
		return $EasyPresenter;
    }

    function setConfig(any oConfig) {
		$EasyConfig = oConfig;
	}

	function setData(any value) {
		$EasyData = value;
	}

	function getConfig() {
		return $EasyConfig;
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
		var Events = getConfig().getevents();
		for (var e in Events) {
			evaluate("getController().#e#()");
        }

        if (not isNull(getPresenter())) {

            getPresenter().setConfig(getConfig());
            getPresenter().setData(getController().getAll());
            if (fileExists(expandpath(sFileToInclude)))
                sResult = getPresenter().includetemplate(sFileToInclude);
            else if (getconfig(scriptname).getsetting("show404"))
                sResult = getPresenter().includetemplate(getConfig(scriptname).get404Template());
            else
                sResult = getPresenter().includetemplate(getConfig(scriptname).getstartTemplate());
			setResult(sResult);
        }
        else
        	setData(getController().getAll());
	}

	string function setResult(string Result) {
        $EasyResult = Result;
    }

    string function getResult() {
        return $EasyResult;
    }

}
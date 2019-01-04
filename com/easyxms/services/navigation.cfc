component output="false" displayname="Basic Navigation" accessors="true"  {

	function init() {
		return this;
	};

	query function getNavigation() {
		return queryNew("name", "link");
	};

}
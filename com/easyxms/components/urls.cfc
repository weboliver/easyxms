component output="false" displayname="Basic Navigation" accessors="true" extends="com.easyxms.services.navigation" {

	query function prepareNavigationforLeftNav() {

		return queryNew("name", "link");

	}

	query function prepareNavigationforTopNav() {

		return queryNew("name", "link");

	}

	query function prepareLogo() {

		return queryNew("name", "link");

	}
}
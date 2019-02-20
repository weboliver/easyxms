component extends="com.easyxms.modules.module" {

	$EasyParts = {

		Welcome = "Hallo Welt!",
		LeftNav = "~t/parts/navigation/leftnav.cfm",
		TopNav = "~t/parts/navigation/topnav.cfm",
		Logo = "~t/parts/navigation/logo.cfm"
	};

	$EasyComponents =
	[
		{
			name="NavigationObject",
			object="custom.services.navigation",
			functions = [
					"prepareNavigationforLeftNav",
					"prepareNavigationforTopNav",
					"prepareLogo"
			]
		}
	];

}
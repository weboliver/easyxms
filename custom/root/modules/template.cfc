/**
 * template Module
 *
 * @author Oliver
 * @date 25.03.16
 **/

component extends="com.easyxms.modules.template" accessors=true output=false persistent=false {

	$EasyParts = {

		Welcome = "Hallo Welt!",
		LeftNav = "~t/parts/navigation/leftnav.cfm",
		TopNav = "~t/parts/navigation/topnav.cfm",
		Logo = "~t/parts/navigation/logo.cfm"
	};

	$EasyTemplate =
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
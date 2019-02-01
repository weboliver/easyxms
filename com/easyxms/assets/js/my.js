function bindElement(ElementName, func) {

	$(ElementName).bind('DOMNodeInserted', func);
	
}
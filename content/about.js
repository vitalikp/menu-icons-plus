
function init()
{
	var addon = window.arguments[0];
	var extensionsStrings = document.getElementById("extensionsStrings");

	var extensionName = document.getElementById("extensionName");
	extensionName.textContent = addon.name;

	var extensionVersion = document.getElementById("extensionVersion");
	extensionVersion.setAttribute("value", extensionsStrings.getFormattedString("aboutVersion", [addon.version]));

	var extensionHomepage = document.getElementById("extensionHomepage");
	extensionHomepage.setAttribute("value", addon.name);
	extensionHomepage.setAttribute("url", addon.homepageURL);

	sizeToContent();
}

function openHomePage(aEvent)
{
	if (aEvent.button != 0)
		return;

	window.close();
	openUILinkIn(aEvent.target.getAttribute("url"), 'tab');
}

function init()
{
	var addon = window.arguments[0];
	var extensionsStrings = document.getElementById("extensionsStrings");

	var extensionName = document.getElementById("extensionName");
	extensionName.textContent = addon.name;

	var extensionVersion = document.getElementById("extensionVersion");
	extensionVersion.setAttribute("value", extensionsStrings.getFormattedString("aboutVersion", [addon.version]));

	sizeToContent();
}
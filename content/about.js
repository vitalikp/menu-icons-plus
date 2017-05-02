
function init()
{
	var addon = window.arguments[0];

	var extensionName = document.getElementById("extensionName");
	extensionName.textContent = addon.name;

	sizeToContent();
}
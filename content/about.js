
function init()
{
	let contribUrls = 
	[
		'www.everaldo.com',
		'www.famfamfam.com',
		'www.oxygen-icons.org',
		'tango.freedesktop.org',
		'p.yusukekamiyamane.com'
	];

	var addon = window.arguments[0];
	var extensionsStrings = document.getElementById("extensionsStrings");

	var extensionName = document.getElementById("extensionName");
	extensionName.textContent = addon.name;

	var extensionVersion = document.getElementById("extensionVersion");
	extensionVersion.setAttribute("value", extensionsStrings.getFormattedString("aboutVersion", [addon.version]));

	var extensionCreatedBy = document.getElementById("extensionCreatedBy");
	extensionCreatedBy.setAttribute("value", addon.creator);

	var extensionDeveloper1 = document.getElementById("extensionDeveloper1");
	extensionDeveloper1.setAttribute("value", addon.developers[0].name);
	
	var extensionContributors = document.getElementById("extensionContributors");
	appendLabels(extensionContributors, addon.contributors, contribUrls);

	var extensionHomepage = document.getElementById("extensionHomepage");
	extensionHomepage.setAttribute("value", addon.name);
	extensionHomepage.setAttribute("url", addon.homepageURL);

	sizeToContent();
}

function appendLabels(node,list,urls)
{
	let i = 0;
	let label;
	
	while (i++ < list.length)
	{
		label = document.createElement("label");
		label.setAttribute("value", list[i-1].name);
		if (urls && urls[i-1])
		{
			label.setAttribute("class", "text-link");
			label.setAttribute("tooltiptext", urls[i-1]);
			label.setAttribute("onclick", "openUILinkIn('http://" + urls[i-1] + "/', 'tab'); window.close();");
		}
		
		node.appendChild(label);
	}
}

function openHomePage(aEvent)
{
	if (aEvent.button != 0)
		return;

	window.close();
	openUILinkIn(aEvent.target.getAttribute("url"), 'tab');
}
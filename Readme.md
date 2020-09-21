This respository is a small excercise. 

This repository will help to know on how to call Palo-alto XML API using shell script. 



An API request typically comprises a number of parameters, as shown in the example below:

https://<firewall>/api/?type=<type>&action=<action>&xpath=<xpath>&key=<apikey>

- API key (key=): The API key allows you to authenticate yourself to the API when making requests. Learn about API Authentication and Security and how to Get Your API Key.

- Request type (type=): Because the XML API allows you to perform a wide array of requests, you must first specify the type of request you want, ranging from configuration to operation, importing to exporting, and from reports to user ID. Learn more about request types.

- Action (action=): When the request type is config (configuration) or op (operational mode command), you must also specify an associated action, such as edit, delete, or move. Learn more about Configuration Actions.

- XML and XPath elements (xpath= or cmd=): When using configuration or operational mode commands on the firewall, you include only the XML or the XPath that specifies the XML node. Learn more about XML and XPath and XPath Node Selection.

To make requests to the PAN-OS XML API, you can use the GET and POST methods.



Portion of the candidate configuration Format: https:///api/key=apikey&type=config&action=get&xpath=

Firewall candidate configuration https:///api/?type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']&key=<api_key>

Address objects in a virtual system (vsys). https:////api/?key=apikey&type=config&action=get&xpath=/config/devices/entry/vsys/entry[@name='vsys1']/address

Full list of applications https:///api/?key=apikey&type=config&action=get&xpath=/config/predefined/application

XML-API - https://docs.paloaltonetworks.com/pan-os/8-1/pan-os-panorama-api/pan-os-xml-api-request-types.html 


https://docs.paloaltonetworks.com/pan-os/8-1/pan-os-panorama-api/pan-os-xml-api-request-types.html 
API Basics:
API Basics: API Type Description 
- type=keygen : Generate API keys for authentication.
- type=config   : Modify the configuration.
- type=commit   : Commit firewall configuration, including partial commits.
- type=op       : Perform operational mode commands, including checking system status and validating configurations.
- type=report   : Get reports, including predefined, dynamic, and custom reports.
- type=log      : Get logs, including traffic, threat, and event logs.
- type=import   : Import files including configurations and certificates.
- type=export   : Export files including packet captures, certificates, and keys.
- type=user-id  : Update User-ID mappings.
- type=version  : Show the PAN-OS version, serial number, and model number.

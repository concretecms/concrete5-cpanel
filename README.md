# concrete5 for WHM/cPanel

concrete5 for WHM/cPanel is a plugin for WHM that allows concrete5 to be automatically installed into cPanel accounts, and upgraded on demand. This plugin - in the cPAddon format - takes care of database creation, file setup, permissions checking and installation.

## Licensing

This plugin is licensed under the AGPL v3:

[http://en.wikipedia.org/wiki/Affero_General_Public_License](http://en.wikipedia.org/wiki/Affero_General_Public_License)

## Installation the cPaddon

Install this cPAddon manually on your server by following the instructions here: http://docs.cpanel.net/twiki/bin/view/SoftwareDevelopmentKit/DistributingAddons

## Installing a new concrete5 Instance into a cPanel Account

To install concrete5 into a cPanel account, whether in the root directory or in a sub-directory/sub-domain, do the following:

1. Sign in to the cPanel Account at the URL http://www.yourdomain.com:2082/
2. Find the "Site Software" link. Click on it.
3. Select "concrete5" from the list of available software programs. It will be listed under "CMS".
4. You should be presented with the concrete5 license, an email address to give to the admin account in your new install, and the ability to choose where in the site you wish to the concrete5 instance installed.
5. When you submit this form, a new concrete5 instance, its database, and its admin user will be created.
lparameters toUpdateObject
local lcAppName, ;
	lcAppID, ;
	lcRepositoryURL, ;
	lcDownloadsURL, ;
	lcVersionFileURL, ;
	lcZIPFileURL, ;
	lcRegisterWithThor

* Set the project settings; edit these for your specific project.

lcAppName       = 'FoxBarcodeQR'
	&& the name of the project
lcAppID         = 'FoxBarcodeQR'
	&& similar to lcAppName but must be URL-friendly (no spaces or other
	&& illegal URL characters)
lcRepositoryURL = 'https://github.com/VFPX/FoxBarcodeQR'
	&& the URL for the project's repository

* If the version file and zip file are in the ThorUpdater folder of the
* master branch of a GitHub repository, these don't need to be edited.
* Otherwise, set lcVersionFileURL and lcZIPFileURL to the correct URLs.

lcDownloadsURL   = strtran(lcRepositoryURL, 'github.com', ;
	'raw.githubusercontent.com') + '/master/ThorUpdater/'
lcVersionFileURL = lcDownloadsURL + lcAppID + 'Version.txt'
	&& the URL for the file containing code to get the available version number
lcZIPFileURL     = lcDownloadsURL + lcAppID + '.zip'
	&& the URL for the zip file containing the project

* This is code to execute after the project has been installed by Thor for the
* first time. Edit this if you want do something different (such as running
* the installed code) or display a different message. You can use code like
* this if you want to execute the installed code; Thor replaces
* ##InstallFolder## with the installation path for the project:
*
* 'do "##InstallFolder##MyProject.prg"'

text to lcRegisterWithThor noshow textmerge
	messagebox('From the Thor menu, choose "More -> Open Folder -> Components" to see the folder where <<lcAppName>> was installed', 0, '<<lcAppName>> Installed', 5000)
endtext

* Set the properties of the passed updater object. You likely won't need to edit this code.

with toUpdateObject
	.ApplicationName      = lcAppName
	.Component            = 'Yes'
	.VersionLocalFilename = lcAppID + 'VersionFile.txt'
	.RegisterWithThor     = lcRegisterWithThor
	.VersionFileURL       = lcVersionFileURL
	.SourceFileUrl        = lcZIPFileURL
	.Link                 = lcRepositoryURL
	.LinkPrompt           = lcAppName + ' Home Page'
	.Notes                = GetNotes()
endwith
return toUpdateObject

* Get the notes for the project. Edit this code as necessary.

procedure GetNotes
local lcNotes
text to lcNotes noshow
FoxBarcodeQR

Project Manager: Guillermo Carrero (RIP) (Barcelona, Spain) and Luis Maria Guayan (Tucuman, Argentina)

FoxBarcodeQR is a supplement of FoxBarcode class only for QR Code barcodes. This class is an alternative solution for all developers who requested QR Code support.
endtext
return lcNotes

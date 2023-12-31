#location of the desired background image file, input as a parameter
$URL = $args[0]

#creates a background image storage folder
md C:\bgimage

#downloads the image and saves it in the desired folder
invoke-webrequest -Uri $URL -OutFile C:\bgimage\MAF.jpg

#Sets the BG image property
set-itemproperty -path "HKCU:Control Panel\Desktop" -name WallPaper -value C:\bgimage\MAF.JPG

#Updates the user settings to apply background image. Runs a few times because it can fail silently
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
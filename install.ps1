## Download Chocolately
$choco_source = 'https://chocolatey.org/install.ps1'
$choco_destination = 'install-choco.ps1'
Invoke-WebRequest -Uri $choco_source -OutFile $choco_destination
 
## Download Install Apps Script
$apps_source = 'https://raw.githubusercontent.com/shillbit/azure-vm/master/install-apps.ps1'
$apps_destination = 'install-apps.ps1'

# ## Download and Install Dev Cert
# $dev_source = 'https://raw.githubusercontent.com/pukauw/azure-vm/master/dev.cer'
# $dev_destination = 'dev.cer'

Invoke-WebRequest -Uri $apps_source -OutFile $apps_destination
# Invoke-WebRequest -Uri $dev_source -OutFile $dev_destination

## Stop the Server Manager Window popping up
Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask -Verbose 

## Install Choco
powershell -NoProfile -ExecutionPolicy Unrestricted -File "./install-choco.ps1"
#powershell -NoProfile -ExecutionPolicy Unrestricted -File "./install-apps.ps1" 
# certutil -enterprise -f -v -AddStore Root dev.cer

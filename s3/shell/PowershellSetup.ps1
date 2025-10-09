##Needed to setup AWS in powershell
Install-Module -Name AWS.Tools.Installer
Install-AWSToolsModule AWS.Tools.S3 -CleanUp
Set-ExecutionPolicy RemoteSigned 
## update command, run periodically
#Update-AWSToolsModule -CleanUp

#Specify user
Set-AWSCredential -ProfileName #MYUSERNAMEHERE##
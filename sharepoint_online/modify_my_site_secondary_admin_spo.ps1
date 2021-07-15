#this powershell script is used to modify the my site secondary admin privilege of a user in sharepoint online(spo)

#spo admin credentials
#define the spo admin url and the spo admin e-mail below
$SpoAdminUrl=""
$SpoAdmin=""

#connect to sharepoint online management shell
Connect-SPOService -Url $SpoAdminUrl -Credential $SpoAdmin

#get sharepoint(onedrive) sites of individual users and assign it to the variable OneDriveSites
$OneDriveSites=Get-SPOSite -IncludePersonalSite $true -Limit ALL -Filter {Url -like "-my.sharepoint.com/personal"}

#for loop to modify spo my site secondary admin privilege of a user

foreach($OneDriveSite in $OneDriveSites)

{
Set-SPOUser -Site $OneDriveSite.Url -LoginName $SpoAdmin -IsSiteCollectionAdmin $false

#display result in console
Write-Host "$SpoAdmin removed from OneDrive of "$OneDriveSite.Owner""
}
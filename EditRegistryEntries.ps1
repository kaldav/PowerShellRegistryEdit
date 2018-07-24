#Create folders
$AFolder = Get-Item -Path HKLM:\SOFTWARE\A -ErrorAction SilentlyContinue
if ($AFolder -eq $null){
 New-Item -Path HKLM:\SOFTWARE\A\
}

$BFolder = Get-Item -Path HKLM:\SOFTWARE\A\B -ErrorAction SilentlyContinue
if ($BFolder -eq $null){
 New-Item -Path HKLM:\SOFTWARE\A\B
}

$VersionsFolder = Get-Item -Path HKLM:\SOFTWARE\A\B\Versions -ErrorAction SilentlyContinue
if ($VersionsFolder -eq $null){
 New-Item -Path HKLM:\SOFTWARE\A\B\Versions
}

#Create and update entry
$name = "asd"
$value = "4";

$ComponentEntry = Get-ItemProperty -Path HKLM:\SOFTWARE\A\B\Versions -Name "$name" -ErrorAction SilentlyContinue
if ($ComponentEntry -eq $null){
 New-ItemProperty -Path HKLM:\SOFTWARE\A\B\Versions -Name "$name"
}
Set-ItemProperty -Path HKLM:\SOFTWARE\A\B\Versions -Name "$name" -Value "$value"



#--------------------------------------------
#read entry

$result = (Get-ItemProperty -Path HKLM:\SOFTWARE\A\B\Versions -ErrorAction SilentlyContinue).asd 
if ($result -eq 4){
 Write-Output "Egyezik: $result"
}

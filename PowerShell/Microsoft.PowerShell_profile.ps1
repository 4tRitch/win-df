# Config file
$json = Get-Content -Path "$env:LOCALAPPDATA/Powershell/conf.json" -Raw | ConvertFrom-Json

# Global Mutables Variables
$HOMEDIR = $json.homedir
$DEVDIR = $json.devdir
$PWSDIR = $json.pwsdir
$VIDIR = $json.vidir


# Global Inmutables Variables
$DFDIR = "$DEVDIR/dot-files"
$CONTADIR = "$PWSDIR/Modules/Contability"


# Imports
Import-Module System -Force
Import-Module Styles -Force
Import-Module Maths -Force
Import-Module Contability -Force

Remove-Variable BasePath -ErrorAction SilentlyContinue


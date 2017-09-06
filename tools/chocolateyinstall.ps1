
$ErrorActionPreference = 'Stop';

$packageName        = 'sslvpn'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url                = Join-Path $scriptPath "sslvpn\SslvpnClient-4.0.2329.msi"
$checksum           = "7cde4467503e8cd670c37a4137e836e479ee5da0b8ee023d74fe5a0f212e60aa"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" "
  validExitCodes= @(0, 3010, 1603, 1641)
  url           = $url
  checksumType  = 'sha256'
  checksum      = $checksum
}

  Install-ChocolateyPackage @packageArgs

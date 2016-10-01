
$ErrorActionPreference = 'Stop';

$packageName        = 'sslvpn'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "https://dl.dropboxusercontent.com/u/6066664/choco/sslvpn/SslvpnClient-4.0.2329.msi"
$url_remote         = "https://dl.dropboxusercontent.com/u/6066664/choco/sslvpn/SslvpnClient-4.0.2329.msi"
#$url_local_trans    = ""
#$url_remote_trans   = ""
$url                = ""
$url_trans          = ""
$checksum           = "7cde4467503e8cd670c37a4137e836e479ee5da0b8ee023d74fe5a0f212e60aa"

# Let's check if should we use local or remote install source
$statusCode = Test-Path $url_local 
if ($statusCode) {
                    $url=$url_local
                    $url_trans=$url_local_trans    
                }
    else {
        $url=$url_remote
        $url_trans=$url_remote_trans
    }
# Someone has won ;)

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`" "
  validExitCodes= @(0, 3010, 1641)
  url           = $url
  checksumType  = 'sha256'
  checksum      = $checksum
}

  Install-ChocolateyPackage @packageArgs

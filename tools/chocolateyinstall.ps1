
$ErrorActionPreference = 'Stop';

$packageName        = 'sslvpn'
$scriptPath         = $(Split-Path $MyInvocation.MyCommand.Path)
$url_local          = "\\office.eleader.biz\wymiana\packages\choco\SslvpnClient-4.0.2329.msi"
$url_remote         = "https://dl.dropboxusercontent.com/u/6066664/choco/sslvpn/SslvpnClient-4.0.2329.msi"
#$url_local_trans    = ""
#$url_remote_trans   = ""
$url                = ""
$url_trans          = ""
$checksum           = "072214ec6c3397848f9dd41b740e79c9"

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
  checksumType  = 'md5'
  checksum      = $checksum
}

try {
  Install-ChocolateyPackage @packageArgs
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}



















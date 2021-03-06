$ver = (get-content VERSION | out-string).Trim()

Write-Output "Building Linux Binary"
$Env:GOOS = "linux"; $Env:GOARCH = "amd64"; go build -ldflags "-X main.Version=$ver" -o bin/core-$Env:GOOS-$Env:GOARCH

Write-Output "Building macOS Binary"
$Env:GOOS = "darwin"; $Env:GOARCH = "amd64"; go build -ldflags "-X main.Version=$ver" -o bin/core-$Env:GOOS-$Env:GOARCH

Write-Output "Building Windows Binary"
$Env:GOOS = "windows"; $Env:GOARCH = "amd64"; go build -ldflags "-X main.Version=$ver" -o bin/core-$Env:GOOS-$Env:GOARCH.exe

Write-Output "Pushing $ver to GitHub"
git commit -q -a -m "Latest binaries $ver"
git push -q origin
Write-Output "Done"
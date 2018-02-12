<#
 # Delete node_modules in every subdirectory
 # 
 # Iterate through each subdirectory (no recursion) and delete /node_modules/
 #>

$subdirs = Get-ChildItem -Directory

$subdirs | ForEach-Object { $counter = 0 } {
  Push-Location $_.name
  Remove-Item node_modules `
    -Recurse `
    -Force `
    -ErrorAction SilentlyContinue
  Pop-Location
  $counter++
  Write-Progress `
    -Activity "Cleaning node_modules folders in each subdirectory" `
    -CurrentOperation /$_.name/node_modules `
    -PercentComplete ($counter / $subdirs.length * 100)
}
 
Write-Output "Cleaned $($subdirs.length) subdirectories"
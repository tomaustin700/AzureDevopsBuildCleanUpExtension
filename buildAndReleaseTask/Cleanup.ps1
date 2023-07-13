$filesToExclude = Get-VstsInput -Name ExcludeFiles

$filesToExclude = $filesToExclude -replace "/", "\"

if (![string]::IsNullOrEmpty($filesToExclude)) {
    $excludedFiles = $filesToExclude -split "`r`n"

    foreach ($excludedFile in $excludedFiles) {
        Write-Host "Excluding $excludedFile"
    }
}

if ($Env:Build_SourcesDirectory -and (Test-Path -Path $Env:Build_SourcesDirectory)) {
    Write-Host "Deleting files in $Env:Build_SourcesDirectory"
    Get-ChildItem -Path $Env:Build_SourcesDirectory -File -Recurse | Where-Object { $_.FullName -notmatch [Regex]::Escape(($excludedFiles -join '|')) } | Remove-Item -Force
}

if ($Env:Build_ArtifactStagingDirectory -and (Test-Path -Path $Env:Build_ArtifactStagingDirectory)) {
    Write-Host "Deleting files in $Env:Build_ArtifactStagingDirectory"
    Get-ChildItem -Path $Env:Build_ArtifactStagingDirectory -File -Recurse | Where-Object { $_.FullName -notmatch [Regex]::Escape(($excludedFiles -join '|')) } | Remove-Item -Force
}

if ($Env:Common_TestResultsDirectory -and (Test-Path -Path $Env:Common_TestResultsDirectory)) {
    Write-Host "Deleting files in $Env:Common_TestResultsDirectory"
    Get-ChildItem -Path $Env:Common_TestResultsDirectory -File -Recurse | Where-Object { $_.FullName -notmatch [Regex]::Escape(($excludedFiles -join '|')) } | Remove-Item -Force
}

if ($Env:Build_BinariesDirectory -and (Test-Path -Path $Env:Build_BinariesDirectory)) {
    Write-Host "Deleting files in $Env:Build_BinariesDirectory"
    Get-ChildItem -Path $Env:Build_BinariesDirectory -File -Recurse | Where-Object { $_.FullName -notmatch [Regex]::Escape(($excludedFiles -join '|')) } | Remove-Item -Force
}


if ($Env:Build_SourcesDirectory -and (Test-Path -Path $Env:Build_SourcesDirectory)){
    Write-Host "Deleting $Env:Build_SourcesDirectory"
    Remove-Item $Env:Build_SourcesDirectory -Force -Recurse
}

if ($Env:Build_ArtifactStagingDirectory -and (Test-Path -Path $Env:Build_ArtifactStagingDirectory)){
    Write-Host "Deleting $Env:Build_ArtifactStagingDirectory"
    Remove-Item $Env:Build_ArtifactStagingDirectory -Force -Recurse
}

if ($Env:Common_TestResultsDirectory -and (Test-Path -Path $Env:Common_TestResultsDirectory)){
    Write-Host "Deleting $Env:Common_TestResultsDirectory"
    Remove-Item $Env:Common_TestResultsDirectory -Force -Recurse
}

if ($Env:Build_BinariesDirectory -and (Test-Path -Path $Env:Build_BinariesDirectory)){
    Write-Host "Deleting $Env:Build_BinariesDirectory"
    Remove-Item $Env:Build_BinariesDirectory -Force -Recurse
}




 

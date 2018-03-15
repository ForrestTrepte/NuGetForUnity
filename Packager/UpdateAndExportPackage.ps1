param (
    [string]$UnityExePath,
    [string]$NuGetForUnityBuildDirectory)

# Copy .dlls from the build into the NuGetEditor folder
$BuildFiles = Join-Path -Path $NuGetForUnityBuildDirectory -ChildPath "*.dll"
$DestinationFolder = Join-Path -Path $PSScriptRoot -ChildPath "Assets\NuGet\Editor"
Copy-Item $BuildFiles -Destination $DestinationFolder

# Launch Unity to export the NuGetForUnity package
$PackageFileName = Join-Path -Path $PSScriptRoot -ChildPath "NuGetForUnity.unitypackage"
Start-Process -FilePath $UnityExePath -ArgumentList "-batchMode -quit -projectPath $PSScriptRoot -exportPackage Assets/NuGet $PackageFileName"

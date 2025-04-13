Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Open a file dialog to select the uTorrent executable
$fileDialog = New-Object System.Windows.Forms.OpenFileDialog
$fileDialog.Filter = "Executable Files (*.exe)|*.exe"
$fileDialog.Title = "Select uTorrent executable"

# Show dialog and get the selected file
if ($fileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $selectedFilePath = $fileDialog.FileName

    # Define the path of the .reg file to modify
    $regFilePath = "magnet_torrent_associate_utorrent.reg"

    # Read the contents of the .reg file
    $regFileContent = Get-Content $regFilePath

    # Define the original path that needs to be replaced
    $originalPath = "C:\\Users\\user\\AppData\\Roaming\\uTorrent\\uTorrent.exe"

    # Prepare the new path with the necessary replacements
    $newPath = $selectedFilePath -replace '\\', '\\'

    # Replace the original path with the new path in the file content
    $updatedRegFileContent = $regFileContent -replace [regex]::Escape($originalPath), $newPath

    # Save the updated content to the .reg file
    Set-Content -Path $regFilePath -Value $updatedRegFileContent

    Write-Host "Registry file updated successfully. New path: $newPath"
} else {
    Write-Host "No file was selected."
}
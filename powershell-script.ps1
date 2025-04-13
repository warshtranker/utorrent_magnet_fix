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

    # Check if the .reg file exists
    if (-Not (Test-Path $regFilePath)) {
        # Show an error message box if the file doesn't exist
        [System.Windows.Forms.MessageBox]::Show("magnet_torrent_associate_utorrent.reg file does not exist! Download from https://github.com/warshtranker/utorrent_magnet_fix", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

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

    # Show a message box indicating the job is done
    [System.Windows.Forms.MessageBox]::Show("magnet_torrent_associate_utorrent.reg file updated successfully. New path is: $newPath", "Job's Done", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)

} else {
    Write-Host "No file was selected."
}
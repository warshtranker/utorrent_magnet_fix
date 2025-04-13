**uTorrent MAGNET links and torrent files association fix for Windows**

![alt text](https://github.com/warshtranker/utorrent_magnet_fix/blob/main/demo.jpg)

Some users may find that they have no way to associate MAGNET urls (magnet://) links and torrent files (.torrent) with uTorrent client. 
Sometimes users can't select uTorrent in "Choose default apps by protocol" settings.

This file fixes this situation. Your browser (like Chrome) will open magnets links automatically.

**NEW METHOD**
1. Download `magnet_torrent_associate_utorrent.reg` and `powershell-script.ps1` to the same folder
2. Right click on `powershell-script.ps1` and select "Run with PowerShell"
3. In file open dialog select your `uTorrent.exe` file
4. The script will save path of selected uTorrent.exe to `magnet_torrent_associate_utorrent.reg`
5. Merge the .reg file with your registry

~~---------------------------------~~

**MANUAL METHOD (old)**
1. Download the .reg file
2. Open it
3. Replace the path to your uTorrent.exe, don't forget to use double slashesh "\\\\" (you should replace it in 6 lines: 13, 21, 28, 39, 47, 62)
4. Save the file
5. Merge edited .reg file with your registry




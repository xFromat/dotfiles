for ($i = 0; $i -lt 5; $i++) {
        wsl.exe -d FedoraLinux-42 -e true
        usbipd attach --wsl --hardware-id 1050:0407
        # "Exit code: $LASTEXITCODE"
        if ($LASTEXITCODE -eq 0) { break }
        Start-Sleep -Seconds 2
}

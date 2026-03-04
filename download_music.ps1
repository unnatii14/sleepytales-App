$dir = "D:\development\workspace\SleepyTales App\assets\audio\music"

# Clear bad/empty files first (keep only files > 100KB)
Get-ChildItem "$dir\*.mp3" | Where-Object { $_.Length -lt 100000 } | Remove-Item -Force
Write-Host "Cleared small/empty files"

# Wikimedia Commons public domain classical music - calm, perfect for kids sleep
$tracks = @(
    @{file="piano-lullaby.mp3";  url="https://upload.wikimedia.org/wikipedia/commons/1/18/Brahms_Lullaby.ogg"},
    @{file="harp-melody.mp3";    url="https://upload.wikimedia.org/wikipedia/commons/e/e5/Gymnopedie_No._1.ogg"},
    @{file="music-box.mp3";      url="https://upload.wikimedia.org/wikipedia/commons/7/74/Fur_Elise.ogg"},
    @{file="forest-birds.mp3";   url="https://upload.wikimedia.org/wikipedia/commons/a/a2/Debussy_-_Clair_de_lune.ogg"},
    @{file="rain-thunder.mp3";   url="https://upload.wikimedia.org/wikipedia/commons/d/dc/Sleep_Away.ogg"},
    @{file="wind-chimes.mp3";    url="https://upload.wikimedia.org/wikipedia/commons/4/4e/Satie-3gymnopedies-1_2_3.ogg"}
)

foreach ($t in $tracks) {
    $path = "$dir\$($t.file)"
    Write-Host "Downloading $($t.file)..."
    curl.exe -sL -A "Mozilla/5.0" -o $path $t.url --max-time 40
    $size = (Get-Item $path -ErrorAction SilentlyContinue).Length
    if ($size -gt 10000) {
        Write-Host "  OK: $([math]::Round($size/1KB))KB"
    } else {
        Write-Host "  FAILED (size=$size)"
    }
}

Write-Host "`nFinal state:"
Get-ChildItem "$dir\*.mp3" | Select-Object Name, @{N='KB';E={[math]::Round($_.Length/1KB)}} | Format-Table -AutoSize

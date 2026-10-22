New-Item -ItemType Directory -Force -Path rotated | Out-Null

Get-ChildItem VID_*.m4v | ForEach-Object {
    $out = "rotated\$($_.Name)"

    ffmpeg -i $_.FullName -vf "transpose=2" -c:v libx264 -crf 20 -preset veryslow -c:a copy -map_metadata 0 $out

    $orig = Get-Item $_.FullName
    $new = Get-Item $out
    $new.CreationTime = $orig.CreationTime
    $new.LastWriteTime = $orig.LastWriteTime
}
function ll {
  param([string]$path)
  if($path -eq ""){ $dirs = Get-ChildItem -Force }
  else{ $dirs = Get-ChildItem -Path $path -Force }
  $supportsVT = $Host.UI.SupportsVirtualTerminal
  $defaultIcon = $iconMap[".default"]


  Write-Host("-----------------")
  foreach ($it in $dirs) {
    # Directorio
    if ($it.PSIsContainer) { $entry = $iconMap[".folder"] }

    # Archivo
    else {
      $ext = $it.Extension.ToLower()

      # Without extention (ej. README, LICENSE, ETC )
      if ([string]::IsNullOrEmpty($ext)) {
        $name = $it.Name.ToLower()
        if ($iconMap.ContainsKey($name)) {
          $entry = $iconMap[$name]
        } else {
          $entry = $defaultIcon
        }
      }

      # With extention (ej. .ps1, .md, etc.)
      else {
        if($it.Name -eq "CMakeLists.txt"){
          $entry = $iconMap[".cmakelists"]
        }
        else{
          if ($iconMap.ContainsKey($ext)) {
            $entry = $iconMap[$ext]
          } else {
            $entry = $defaultIcon
          }
        }
      }
    }

    $icon  = if ($supportsVT) { $entry.Icon } else { "" }
    $color = $entry.Color

    Write-Host "$color$icon  $($it.Name)"  }

  Write-Host("-----------------")
}


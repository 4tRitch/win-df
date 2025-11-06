function ll {
  param([string]$path)
  if($path -eq ""){ $dirs = Get-ChildItem }
  else{ $dirs = Get-ChildItem -Path $path }
  $supportsVT = $Host.UI.SupportsVirtualTerminal
  $defaultIcon = $iconMap[".default"]


  Write-Host("-----------------")
  foreach ($it in $dirs) {
    if ($it.PSIsContainer) {
      # Directorio
      $entry = $iconMap[".folder"]
    } else {
      # Archivo
      $ext = $it.Extension.ToLower()

      if ([string]::IsNullOrEmpty($ext)) {
        # Sin extensión (ej. README, LICENSE, Dockerfile, Makefile)
        $name = $it.Name.ToLower()
        if ($iconMap.ContainsKey($name)) {
          $entry = $iconMap[$name]
        } else {
          $entry = $defaultIcon
        }
      } else {
        # Con extensión normal (ej. .ps1, .md, etc.)
        if ($iconMap.ContainsKey($ext)) {
          $entry = $iconMap[$ext]
        } else {
          $entry = $defaultIcon
        }
      }
    }

    $icon  = if ($supportsVT) { $entry.Icon } else { "" }
    $color = $entry.Color

    Write-Host "$color$icon  $($it.Name)"  }

  Write-Host("-----------------")
}


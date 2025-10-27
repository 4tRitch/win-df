function ll {
  param([string]$path)
  if($path -eq ""){ $dirs = Get-ChildItem }
  else{ $dirs = Get-ChildItem -Path $path }
  $supportsVT = $Host.UI.SupportsVirtualTerminal
  $defaultIcon = $iconMap[".default"]


  Write-Host("-----------------")
  foreach ($it in $dirs) {
    if ($it.PSIsContainer) {
      $icon = $iconMap[".folder"].Icon
      $color = $iconMap[".folder"].Color
    } else {
      $ext = $it.Extension.ToLower()
      $entry = if ($iconMap.ContainsKey($ext)) { $iconMap[$ext] } else { $defaultIcon }
      $icon  = $supportsVT ? $entry.Icon : ""
      $color = $entry.Color
    }

    Write-Host "$color$icon  $($it.Name)"
  }

  Write-Host("-----------------")
}


function global:prompt {
  # Current Path
  $cwd = "~"
  if ([string](Get-Location).Path -ne $env:USERPROFILE) {
    $cwd = Split-Path (Get-Location).Path -Leaf
  }

  # Time
  $time = Get-Date -Format "HH:mm"
  $timeSym = "at $time"

  # # Symbols
  # $arrow = "> "


  # Git info
  $gitSym = ""

  if (Get-Command git -ErrorAction SilentlyContinue) {
    try {
      $status = git status --porcelain --branch 2>$null
      if (-not $status) { return "$cwd $timeSym $arrow" }

      # Colors
      $gitColor = $PSStyle.Foreground.FromRgb(204,111,130)
      $resetColor = "$([char]27)[0m"

      $branchLine = $status | Select-Object -First 1
      $symbols = ""
      $branch = ""

      # CASE 1: repo without commits
      if ($branchLine -match '^## No commits yet on (.+)$') {
        $branch = $Matches[1]

        if ($status.Count -gt 1) {
          $symbols = "!"
        }
      }

      # CASO 2: normal reponormal
      elseif ($branchLine -match '^##\s+(.+?)(?:\.{3}|$)') {
        $branch = $Matches[1]

        # ahead / behind (until last fetch)
        if ($branchLine -match 'ahead \d+')  { $symbols += '>' }
        if ($branchLine -match 'behind \d+') { $symbols += '<' }

        # dirty
        if ($status.Count -gt 1) {
          $symbols += '!'
        }
      }

      #Print git symbols
      if($symbols -ne ""){
        $gitSym = "${gitColor}[$branch $symbols]$resetColor"
      }
      else {
        $gitSym = "${gitColor}[$branch]$resetColor"
      }

    } catch {}
  }

  return "$cwd $timeSym $gitSym $arrow"
}

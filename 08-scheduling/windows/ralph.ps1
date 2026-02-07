# ralph.ps1 - Ralph Loop for Windows (PowerShell 7+)
# Usage: .\ralph.ps1 -MaxIterations 15 -Tool claude
param(
    [int]$MaxIterations = 15,
    [string]$Tool = "claude"
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$LogDir = Join-Path $ScriptDir "..\..\logs"
New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
$LogFile = Join-Path $LogDir "ralph-$(Get-Date -Format 'yyyyMMdd-HHmmss').log"

function Write-Log($msg) {
    $ts = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$ts $msg" | Tee-Object -Append $LogFile
}

Write-Log "Starting Ralph Loop (max $MaxIterations iterations, tool: $Tool)"

for ($i = 1; $i -le $MaxIterations; $i++) {
    Write-Log "=== Iteration $i of $MaxIterations ==="
    $prompt = Get-Content (Join-Path $ScriptDir "CLAUDE.md") -Raw

    if ($Tool -eq "claude") {
        $output = $prompt | claude -p --dangerously-skip-permissions
    } elseif ($Tool -eq "copilot") {
        $output = $prompt | copilot -p --yolo
    } elseif ($Tool -eq "amp") {
        $output = $prompt | amp -p --dangerously-allow-all
    }

    if ($output -match "COMPLETE") {
        Write-Log "Loop completed at iteration $i"
        break
    }

    Write-Log "Iteration $i finished, continuing..."
}

Write-Log "Ralph finished after $i iterations."

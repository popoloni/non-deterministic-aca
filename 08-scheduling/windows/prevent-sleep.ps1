# prevent-sleep.ps1 - Keep Windows awake during Ralph loops
# Run before starting an overnight loop.
# Re-enables sleep settings when the loop finishes.

param(
    [switch]$Restore
)

if ($Restore) {
    Write-Host "Restoring default power settings..."
    powercfg /change standby-timeout-ac 30
    powercfg /change monitor-timeout-ac 15
    Write-Host "Sleep and monitor timeout restored."
} else {
    Write-Host "Disabling sleep for overnight Ralph loop..."
    powercfg /change standby-timeout-ac 0
    powercfg /change monitor-timeout-ac 0
    Write-Host "Sleep and monitor timeout disabled."
    Write-Host "Run '.\prevent-sleep.ps1 -Restore' to re-enable."
}

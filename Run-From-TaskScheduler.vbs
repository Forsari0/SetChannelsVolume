Set objShell = CreateObject("Wscript.Shell")
Set objArgs = Wscript.Arguments
objShell.Run("powershell -WindowStyle Hidden -ExecutionPolicy Bypass -NonInteractive ""&"" ""'" & objArgs(0) & "\SetChannelsVolume.ps1'"""), 0
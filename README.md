# SetChannelsVolume.ps1
Set channels volume level of master audio-stream to a single value (manually or from task scheduler)
## Why?
Sometimes (for God’s only known reasons) position-sound levels of my *Speaker* audio-device is going nuts and in the end it looks something like this:  
So, after many-many times when I'm manually set this levels to the same value, I decided to write simple *powershell script* to mitigate this problem.
## Manual usage
You can simply run `SetChannelsVolume.ps1` from `powershell` session and script set all channels sound levels to the **biggest** value:
```
powershell .\SetChannelsVolume.ps1
Channels count - 6
Current master volume - 55%

Channel 1 volume - 47%, set it to 55%
Channel 2 volume - 11%, set it to 55%
Channel 3 volume - 6%, set it to 55%
Channel 4 volume - 55%, skip
Channel 5 volume - 14%, set it to 55%
Channel 6 volume - 36%, set it to 55%
```

Or you can run `SetChannelsVolume.ps1` with `-Volume` (**ranged from 0 to 100**) parameter and set all channels volume level to desired value:
```
powershell .\SetChannelsVolume.ps1 -Volume 25
Channels count - 6
Current master volume - 20%
Set master volume to - 25%

Channel 1 volume - 20%, set it to 25%
Channel 2 volume - 20%, set it to 25%
Channel 3 volume - 20%, set it to 25%
Channel 4 volume - 20%, set it to 25%
Channel 5 volume - 20%, set it to 25%
Channel 6 volume - 20%, set it to 25%
```
You can also quickly set channels volume level with `QuickSetTo10%.bat`.  
Change `level` variable to desired value (rename `bat` file) and run.  
## Task scheduler
If you want to invoke this *powershell script* from *task scheduler*, for example, every 30 minutes, you can create *task* with `schtasks.exe` (or manually, of course):
```
schtasks /create /sc minute /tn "Sets channels volume level of master audio-stream to to a single (biggest) value" /mo 30 /tr "wscript 'C:\ChannelVolumeEqualizer\Run-From-TaskScheduler.vbs' 'C:\ChannelVolumeEqualizer'"
```
First `wscript` argument is path to `Run-From-TaskScheduler.vbs` script (obviosly) and the second one is *workdir* - where `SetChannelsVolume.ps1` is placed.

Why we need to run this from `wscript`, not just from ordinary `cmd`?  
Because of annoying one-second console window blink on the screen.  
## Credits
[@sverrirs](https://gist.github.com/sverrirs) for his useful [gist](https://gist.github.com/sverrirs/d099b34b7f72bb4fb386) (almost all `Add-Type` code taken from there).  
[@Roy-Orbison](https://github.com/Roy-Orbison) for a simple [solution](https://github.com/PowerShell/PowerShell/issues/3028#issuecomment-522375489) with console-window-blinks problem.

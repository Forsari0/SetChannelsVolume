@echo off

SET level=10

powershell -ExecutionPolicy Bypass .\SetChannelsVolume.ps1 -Volume %level%
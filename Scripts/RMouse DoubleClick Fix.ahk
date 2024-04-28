RegRead minDelay, HKCU, Software\MouseDebouncer, MinDelay
if ErrorLevel
	minDelay := 50  ; Default setting.

#NoTrayIcon  ; Hide initial icon.
~RButton::
; Do nothing at all -- click has not been blocked.  This hotkey has
; already achieved its purpose by causing A_PriorHotkey etc to be set.
return

#If A_PriorHotkey != "" && A_TimeSincePriorHotkey < minDelay
RButton::
SoundPlay *-1  ; Play a sound to indicate the click has been blocked.
return

TrayConfigure:
prompt := "Enter the minimum time between clicks, in milliseconds.`n"
		. "Any double-clicks faster than this will be blocked."
Loop
{
	InputBox newMinDelay, Mouse Debouncer, %prompt%,,,,,,,, %minDelay%
	if ErrorLevel  ; Cancelled?
		return
	if (newMinDelay+0 >= 10 && newMinDelay <= 1000)	 ; Valid?
		break
	if (A_Index = 1)
		prompt .= "`n`nPlease enter a number between 10 and 1000."
}
minDelay := newMinDelay
if (minDelay = 50)
	RegDelete HKCU, Software\MouseDebouncer
else
	RegWrite REG_DWORD, HKCU, Software\MouseDebouncer, MinDelay, %minDelay%
return

TrayExit:
ExitApp

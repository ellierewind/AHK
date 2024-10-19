#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, Icon, shell32.dll, 26 ;changes the taskbar icon to something

SetBatchLines, -1
SetMouseDelay, 0

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

CoordMode, Mouse, screen
CoordMode, Pixel, screen

#InstallKeybdHook
#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!

SetCapsLockState, AlwaysOff
					
;-------------------------------------------------------
; AUTO EXECUTE SECTION FOR INCLUDED SCRIPTS
; Scripts being included need to have their auto execute
; section in a function or subroutine which is then
; executed below.
;-------------------------------------------------------
Gosub, gui_autoexecute
;-------------------------------------------------------
; END AUTO EXECUTE SECTION
return
;-------------------------------------------------------



; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
; !CapsLock::
;     GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
;     if capsstate = U
;         SetCapsLockState, AlwaysOn
;     else
;         SetCapsLockState, AlwaysOff
;     return


; A function to escape characters like & for use in URLs.
uriEncode(str) {
    f = %A_FormatInteger%
    SetFormat, Integer, Hex
    If RegExMatch(str, "^\w+:/{0,2}", pr)
        StringTrimLeft, str, str, StrLen(pr)
    StringReplace, str, str, `%, `%25, All
    Loop
        If RegExMatch(str, "i)[^\w\.~%/:]", char)
           StringReplace, str, str, %char%, % "%" . SubStr(Asc(char),3), All
        Else Break
    SetFormat, Integer, %f%
    Return, pr . str
}

;;;;-----------------------------------------------------------------------------------------------;
;                                    ;;;<Settings>;;;                                              ;
;;;;-----------------------------------------------------------------------------------------------;

; General Settings
#Include %A_ScriptDir%\Settings\General.ahk

; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

; Load Functions
#Include %A_ScriptDir%\Settings\Functions.ahk

; Load Hotstrings
#Include %A_ScriptDir%\Settings\Hotstrings.ahk

#x:: ; Windows Key + X
Reload
Return

^#x::
Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"

;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Windows Hotkeys ;;;                                    ;    
;__________________________________________________________________________________________;



;------------------------------------------------------------------------------------------------------------------

;       ;;; Keyboard Assignments ;;;

F12::
send {Delete}
Return

^F12::
send {Ctrl Down}{Delete}{Ctrl Up}
Return

!F12::
send {Alt Down}{Delete}{Alt Up}
Return

+F12::
send {Shift Down}{Delete}{Shift Up}
Return

\::
SendInput, `;
Return

+\::
SendInput, `:
Return

`;::
SendInput, `\
Return

+;::
SendInput, `|
Return
;------------------------------------------------------------------------------------------------------------------



#IfWinActive ahk_class MozillaWindowClass
^+n::^+p
#IfWinActive

;------------------------------------------------------------------------------------------------------------------

;       ;;; G604 Assignments ;;;

F24 & WheelUp::
SendInput, {Volume_Up}   ; F24 + Scroll Wheel Up as Volume up
Return

F24 & WheelDown::
SendInput, {Volume_Down} ; F24 + Scroll Wheel Down as Volume down
Return

F24 & Left::
VirtualDesktop("Left")   ; F24 + Left as Switch to Previous Virtual Desktop
Return

F24 & Right::
VirtualDesktop("Right")  ; F24 + Right as Switch to Next Virtual Desktop
Return



F23::
MouseClicker("LButton", "F23") ; (LRButton, Key) F23 as LeftClick
Return

F22::
MouseClicker("RButton", "F22") ; (LRButton, Key) F22 as RightClick
Return


F24 & F23::
MouseAutoClicker("Left",  "F24", "F23", 1) ; (LeftRight, Key1, Key2, HowFast) F24 + F23 as Auto LeftClick
return

F24 & F22::
MouseAutoClicker("Right", "F24", "F22", 1) ; (LeftRight, Key1, Key2, HowFast) F24 + F23 as Auto RightClick
return

;-------------------------------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replaces the Pause key to Windows Key + D [Show Desktop] ;;;

#IfWinNotActive, ahk_class MediaPlayerClassicW ; Disables this hotkey when mpc-hc is in focus
Pause::#d
#IfWinNotActive
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replaces Page Up & Page Down to Numpad+ & Numpad- [Speed Up & Down in mpc-hc] ;;;


#IfWinActive, ahk_class MediaPlayerClassicW

; Remap Page Up to Numpad +
PgUp::NumpadAdd
Return

; Remap Page Down to Numpad -
PgDn::NumpadSub
Return

#IfWinActive


;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Middle mouse button to move up a folder in Explorer and Context Explorer ;;;
;       ;;; Disables F1 key in File Explorer ;;;

#If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class #32770")
~MButton::Send !{Up} 
F1::;
#If
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Remaps F1 to Play/Pause (in Google Chrome) ;;;

#IfWinActive ahk_exe chrome.exe
	F1::Media_Play_Pause
#IfWinActive
	Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Adds "Windows Key" + Scroll Up/Down as a modifier for Volume Control ;;;
;       ;;; Replaces Windows Key / Alt + Numpad Keys for Volume Control ;;;

#WheelUp::
SendInput, {Volume_Up} ; Windows Key + Scroll Wheel Up as Volume up
Return

#WheelDown::
SendInput, {Volume_Down} ; Windows Key + Scroll Wheel Down as Volume down
Return

#NumpadHome::
#Numpad7::
!NumpadHome::
!Numpad7::
SendInput, {Volume_Up}   ; Replaces Windows Key / Alt + NumpadHome/Numpad7 [Home]/[7] as Volume up
Return

#NumpadLeft::
#Numpad4::
!NumpadLeft::
!Numpad4::
SendInput, {Volume_Down} ; Replaces Windows Key / Alt + NumpadLeft/Numpad4 [Left]/[4] as Volume Down
Return

#NumpadUp::
#Numpad8::
!NumpadUp::
!Numpad8::
SendInput, {Volume_Mute} ; Replaces Windows Key / Alt + NumpadUp/Numpad8   [Up]/[8]   as Volume Mute
Return


;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Switch Virtual Desktops. Use Windows Key + Q and Windows Key + E ;;;

#q::
VirtualDesktop("Left")
Return

#e::
VirtualDesktop("Right")
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Toggles File Extensions (in Windows Explorer) ;;;

#y:: ; Windows + Y
f_ToggleFileExt()
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Toggles Hidden Files. Use [Windows Key + H] ;;;

#U:: ; Windows + U
f_ToggleHidden()
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Insert Date and Time with Windows Key + W and Windows Key + Shift + W [Only works if Scroll Lock is NOT active] ;;;

#If !GetKeyState("ScrollLock", "T") ; Restrict hotkeys to only work when Scroll Lock is NOT active


#w:: ; Windows + W
SendTimeDate("yyyy-MM-dd - hh;mm;ss tt")
Return

+#w:: ; Windows + Shift + W
SendTimeDate("hh;mm;ss tt")
Return

#If ; End of Scroll Lock restriction

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Zooms in and Pans up in MPC-HC with Windows Key + M ;;;

#IfWinActive ahk_class MediaPlayerClassicW  ; Restrict script to MPC-HC
'::
MPCZoomer(12, 12) ; (Up, Zoom)
#IfWinActive ; End of restriction
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------------------------------

;       ;;; Ctrl Alt S = Select Files - Add Files Names to text file ;;;

^!s:: ; Ctrl + Alt + S
SelectFilesText()
Return

;-------------------------------------------------------------------------------------------------------------------



;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Gaming Hotkeys ;;;                                     ;    
;__________________________________________________________________________________________;



;-------------------------------------------------------------------------------------------

;       ;;; Please make sure that the screen coords are accurate. If the mouse clicks look off, replace the coordinates down in the functions below and use WindowSpy to replace the coords with your own. ;;;
;       ;;; This currently only works with my screen (3440x1440), and only if Minecraft is maximized, and has the GUI Scale set to 3. ;;;

#IfWinActive ahk_exe javaw.exe  ; Minecraft

F15::                           ; AutoCraft with Crafting Book
MCAutoCraft("Gold Ingot", 4, 1) ;(ItemName, LoopTimes, HowFast)
Return

F16::                           ; Enchant 27 Books
MCEnchant(27, 15)               ; (LoopsX, HowFast)

F14::                           ; Repair Item for ATM8 - Tool on Slot X - Repair on Slot Y
MCRepairItem(1, 2, 1, 50)       ; (HotbarSlotX, HotbarSlotY, LoopTimes, HowFast)

#IfWinActive
Return

;-------------------------------------------------------------------------------------------


; ; Define hotkey Alt+Shift+T (^!t) to convert the clipboard text to title case (capitalize first letter of each word)
; F1:: ; Ctrl+Alt+Shift+T
;     clipboard := ""            ; Clear the clipboard first
;     send ^{c}                  ; Send Ctrl+C to copy the selected text to the clipboard
;     clipWait, 0.3              ; Wait up to 0.3 seconds for the clipboard to have content
;     stringLower, clipboard, clipboard ; Convert the clipboard text to lowercase
;     stringUpper, clipboard, clipboard, T ; Convert the first letter of each word to uppercase
;     send ^{v}                  ; Send Ctrl+V to paste the modified clipboard content
;     return
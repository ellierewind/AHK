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



;-------------------------------------------------------------------------------------------------------------------

;       ;;; Royal Kludge Keyboard Broken Keys Reassign ;;;

\::
SendInput, `;
Return

+\::
SendInput, `:
Return

NumpadDiv::
SendInput,\
Return

+NumpadDiv::
SendInput,|
Return

+NumpadSub::
SendInput, {NumpadSub}
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replaces NumpadSubtract [-] to Windows Key + D [Show Desktop] ;;;

#IfWinNotActive, ahk_class MediaPlayerClassicW ; Disables this hotkey when mpc-hc is in focus
NumpadSub::#d
#IfWinNotActive
Return

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

;       ;;; Remaps F1 and F12 to Play/Pause (in Google Chrome) ;;;

#IfWinActive ahk_exe chrome.exe
	F1::Media_Play_Pause
	F12::Media_Play_Pause   
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

#h:: ; Windows + H
f_ToggleHidden()
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Insert Date and Time with Windows Key + W and Windows Key + Shift + W ;;;

#w:: ; Windows + W
SendTimeDate("yyyy-MM-dd - hh;mm;ss tt")
Return

+#w:: ; Windows + Shift + W
SendTimeDate("hh;mm;ss tt")
Return

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

^!s:: ; Ctrl + Alt + s
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
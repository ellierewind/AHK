;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; <Settings> ;;;                                         ;    
;__________________________________________________________________________________________;


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

^#x:: ; Ctrl + Windows + X - Launch Window Spy
Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"


;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Windows Hotkeys ;;;                                    ;    
;__________________________________________________________________________________________;



;-----------------------------------------------------------------------------------------------------------------------------------------

;       ;;; Keyboard Assignments ;;;

F12::
send {Delete}                          ; F12 as Delete
Return

^F12::
send {Ctrl Down}{Delete}{Ctrl Up}      ; Ctrl + F12 as Ctrl + Delete
Return

!F12::
send {Alt Down}{Delete}{Alt Up}        ; Alt + F12 as Alt + Delete
Return

+F12::
send {Shift Down}{Delete}{Shift Up}    ; Shift + F12 as Shift + Delete
Return



\::
SendInput, `;                          ; \ key as semicolon
Return

+\::
SendInput, `:                          ; Shift + \ as colon  
Return

`;::
SendInput, `\                          ; semicolon key as backslash
Return

+;::
SendInput, `|                          ; Shift + semicolon as pipe
Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Mouse Assignments ;;;

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

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Switch Virtual Desktops. Use Windows Key + Q and Windows Key + E ;;;

#q::
VirtualDesktop("Left")
Return

#e::
VirtualDesktop("Right")
Return

;------------------------------------------------------------------------------------------------------------------




;------------------------------------------------------------------------------------------------------------------

;       ;;; Replaces the Pause key to Windows Key + D  [Show Desktop in mpc-hc] ;;;

#IfWinNotActive, ahk_class MediaPlayerClassicW ; Disables this hotkey when mpc-hc is in focus
Pause::#d
#IfWinNotActive
Return

;------------------------------------------------------------------------------------------------------------------




;------------------------------------------------------------------------------------------------------------------

;       ;;; Middle mouse button to move up a folder in Explorer and Context Explorer ;;;
;       ;;; Disables F1 key in File Explorer ;;;

#If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class #32770")
~MButton::Send !{Up} 
F1::;
#If
Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

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

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Toggles File Extensions. Use [Windows Key + U] ;;;

#y:: ; Windows + Y
f_ToggleFileExt()
Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Toggles Hidden Files. Use [Windows Key + H] ;;;

#U:: ; Windows + U
f_ToggleHidden()
Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Remaps F1 to Play/Pause (in Google Chrome) ;;;

#IfWinActive ahk_exe chrome.exe
	F1::Media_Play_Pause
#IfWinActive
	Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Replaces Page Up & Page Down to Numpad+ & Numpad- [Speed Up & Down in mpc-hc] ;;;

#IfWinActive, ahk_class MediaPlayerClassicW

; Remap Page Up to Numpad +
PgUp::NumpadAdd
Return

; Remap Page Down to Numpad -
PgDn::NumpadSub
Return

#IfWinActive

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Maps Arrow Keys to Numpad Keys for mpc-hc ;;;

#IfWinActive, ahk_class MediaPlayerClassicW

q & Up::Numpad8     ; q + Up Arrow remapped to Numpad 8
q & Down::Numpad2   ; q + Down Arrow remapped to Numpad 2
q & Left::Numpad4   ; q + Left Arrow remapped to Numpad 4
q & Right::Numpad6  ; q + Right Arrow remapped to Numpad 6

w & Up::^Numpad8     ; w + Up Arrow remapped to Ctrl + Numpad 8
w & Down::^Numpad2   ; w + Down Arrow remapped to Ctrl + Numpad 2
w & Left::^Numpad4   ; w + Left Arrow remapped to Ctrl + Numpad 4
w & Right::^Numpad6  ; w + Right Arrow remapped to Ctrl + Numpad 6

End::Numpad5         ; End remapped to Numpad 5

Return

#IfWinActive

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Insert Date and Time with Windows Key + W and Windows Key + Shift + W [Only works if Scroll Lock is NOT active] ;;;

#If !GetKeyState("ScrollLock", "T") ; Restrict hotkeys to only work when Scroll Lock is NOT active


#w:: ; Windows + W
SendTimeDate("yyyy-MM-dd - hh;mm;ss tt")
Return

+#w:: ; Windows + Shift + W
SendTimeDate("hh;mm;ss tt")
Return

#If ; End of Scroll Lock restriction

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Zooms in and Pans up in MPC-HC with Windows Key + M ;;;

#IfWinActive ahk_class MediaPlayerClassicW  ; Restrict script to MPC-HC
'::
MPCZoomer(1, 1, 0, 0, 0) ; (Zoom, UpPos, DownPos, LeftPos, RightPos)
#IfWinActive ; End of restriction
Return

#IfWinActive ahk_class MediaPlayerClassicW  ; Restrict script to MPC-HC
+'::
MPCZoomer(1, 0, 1, 0, 0) ; (Zoom, UpPos, DownPos, LeftPos, RightPos)
#IfWinActive ; End of restriction
Return

;------------------------------------------------------------------------------------------------------------------



;------------------------------------------------------------------------------------------------------------------

;       ;;; Ctrl Alt S = Select Files - Add Files Names to text file ;;;

^!s:: ; Ctrl + Alt + S
SelectFilesText()
Return

;-------------------------------------------------------------------------------------------------------------------



;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Gaming Hotkeys ;;;                                     ;    
;__________________________________________________________________________________________;



;------------------------------------------------------------------------------------------------------------------

;       ;;; Please make sure that the screen coords are accurate. If the mouse clicks look off, replace the coordinates down in the functions below and use WindowSpy to replace the coords with your own. ;;;
;       ;;; This currently only works with Ellie's screen (3440x1440), and only if Minecraft is maximized (not fullscreen), and has the GUI Scale set to 3. ;;;

#IfWinActive ahk_exe javaw.exe  ; Minecraft

F15::                           ; AutoCraft with Crafting Book
MCAutoCraft("Bone", 4, 1)       ;(ItemName, LoopTimes, HowFast)
Return

F16::                           ; Enchant 27 Books
MCEnchant(27, 15)               ; (LoopsX, HowFast)

F14::                           ; Repair Item for ATM8 - Tool on Slot X - Repair on Slot Y
MCRepairItem(1, 2, 1, 50)       ; (HotbarSlotX, HotbarSlotY, LoopTimes, HowFast)

#IfWinActive
Return

;------------------------------------------------------------------------------------------------------------------
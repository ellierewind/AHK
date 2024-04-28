;;;;-----------------------------------------------------------------------------------------------;
;                            ;;;<Ignore This Part>;;;                                              ;
;;;;-----------------------------------------------------------------------------------------------;

; General settings
#Include %A_ScriptDir%\Settings\General.ahk

; Load the GUI code
#Include %A_ScriptDir%\GUI\GUI.ahk

#x:: ; Windows Key + X
Reload
Return

^#x::
Run "C:\Program Files\AutoHotkey\UX\WindowSpy.ahk"

;;;;-----------------------------------------------------------------------------------------------;
;                            ;;;<Pre-requisites>;;;                                                ;
;;;;-----------------------------------------------------------------------------------------------;

; For the preset() function [Created by TaranVH] to work, you MUST go into Adobe Premiere's Keyboard Shortcuts panel,
; find the following commands, and add these keyboard shortcut assignments to them:
; 
; Ctrl +               B      Application > Select Find Box
; Ctrl + Alt + Shift + K      Application > Shuttle Stop
; Ctrl + Alt + Shift + 1      Application > Window > Project         (Default is Shift + 1) (This sets the focus onto a BIN) 
; Ctrl + Alt + Shift + 3      Application > Window > Timeline        (Default is Shift + 3)
; Ctrl + Alt + Shift + 4      Application > Window > Program Monitor (Default is Shift + 4)
; Ctrl + Alt + Shift + 5      Application > Window > Effect Controls (Default is Shift + 5)
; Ctrl + Alt + Shift + 7      Application > Window > Effects         (Default is Shift + 7)
;
; Alternatively, you can add your pre-made keyboard shortcuts to Adobe Premiere.

;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Windows Hotkeys ;;;                                    ;    
;__________________________________________________________________________________________;



;------------------------------------------------------------------------------------------------------------------

;       ;;; G604 Assignments ;;;

F24 & WheelUp::
SendInput, {Volume_Up} ; F4 + Scroll Wheel Up as Volume up
Return

F24 & WheelDown::
SendInput, {Volume_Down} ; F24 + Scroll Wheel Down as Volume down
Return

F24 & Left::
VirtualDesktop("Left")
Return

F24 & Right::
VirtualDesktop("Right")
Return



F23::
MouseClicker("LButton","F23")
Return

F22::
MouseClicker("RButton","F22")
Return



F24 & F23::
MouseAutoClicker("Left","F24","F23")
return

F24 & F22::
MouseAutoClicker("Right","F24","F22")
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

;       ;;; Middle mouse button to move up a folder in Explorer ;;;

#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up} 
#IfWinActive
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Middle mouse button to move up a folder in Context Explorer ;;;

#IfWinActive, ahk_class #32770
~MButton::Send !{Up} 
#IfWinActive
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Adds "Windows Key" + Scroll Up/Down as a modifier for Volume Control ;;;

#WheelUp::SendInput, {Volume_Up} ; Windows Key + Scroll Wheel Up as Volume up
#WheelDown::SendInput, {Volume_Down} ; Windows Key + Scroll Wheel Down as Volume down
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

;       ;;; Replaces NumpadSubtract [-] to Windows Key + D [Show Desktop] ;;;

#IfWinNotActive, ahk_class MediaPlayerClassicW ; Disables this hotkey when mpc-hc is in focus
{	
NumpadSub::#d
}
#IfWinNotActive
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replaces Windows key + Numpad Keys for Volume Control ;;;

#NumpadHome::
Send {Volume_Up}   ; Replaces Windows Key + NumpadHome [Home] as Volume up   [Numlock has to be off]
Return

#NumpadLeft::
Send {Volume_Down} ; Replaces Windows Key + NumpadLeft [Left] as Volume Down [Numlock has to be off]
Return

#NumpadUp::
Send {Volume_Mute} ; Replaces Windows Key + NumpadUp   [Up]   as Volume Mute [Numlock has to be off]
Return


#Numpad7::
Send {Volume_Up}   ; Replaces Windows Key + Numpad7    [7]    as Volume up   [Numlock has to be on]
Return

#Numpad4::
Send {Volume_Down} ; Replaces Windows Key + Numpad4    [4]    as Volume Down [Numlock has to be on]
Return

#Numpad8::
Send {Volume_Mute} ; Replaces Windows Key + Numpad8    [8]    as Volume Mute [Numlock has to be on]
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replaces Alt + Numpad Keys for Volume Control ;;;

!NumpadHome::
Send {Volume_Up}   ; Replaces Alt Key + NumpadHome [Home] as Volume up   [Numlock has to be off]
Return

!NumpadLeft::
Send {Volume_Down} ; Replaces Alt Key + NumpadLeft [Left] as Volume Down [Numlock has to be off]
Return

!NumpadUp::
Send {Volume_Mute} ; Replaces Alt Key + NumpadUp   [Up]   as Volume Mute [Numlock has to be off]
Return


!Numpad7::
Send {Volume_Up}   ; Replaces Alt Key + Numpad7    [7]    as Volume up   [Numlock has to be on]
Return

!Numpad4::
Send {Volume_Down} ; Replaces Alt Key + Numpad4    [4]    as Volume Down [Numlock has to be on]
Return

!Numpad8::
Send {Volume_Mute} ; Replaces Alt Key + Numpad8    [8]    as Volume Mute [Numlock has to be on]
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Changes Tab (in Google Chrome) ;;;

#IfWinActive ahk_exe chrome.exe
	F1::^+Tab
	F2::^Tab
#IfWinActive
	Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Toggles File Extensions (in Windows Explorer) ;;;

#y:: ;Windows + Y
f_ToggleFileExt()
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Toggles Hidden Files. Use [Windows Key + H] ;;;

#h:: ;Windows + W
f_ToggleHidden()
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Insert Date and Time with Windows Key + W and Windows Key + Shift + W ;;;

#w:: ; Windows + W
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh;mm tt
Send %CurrentDateTime%
Return

+#w:: ; Windows + Shift + W
FormatTime, CurrentTime,, hh;mm tt
Send %CurrentTime%
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Replace "Insert" key with Paste (Ctrl + V). Use [Insert] ;;;

Ins::^v
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Disables F1 key in File Explorer ;;;

#IfWinActive ahk_class CabinetWClass
F1::
#IfWinActive
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Zooms in and Pans up in MPC-HC with Windows Key + M ;;;

#IfWinActive ahk_class MediaPlayerClassicW  ; Restrict script to MPC-HC

':: ; Win+M

  ; Send Numpad9 x times - Zooms in using MPC-HC
  Loop, 12
  {
    SendInput, {Numpad9}
  }

  ; Send Ctrl+Numpad9 x times - Pans up using MPC-HC
  Loop, 12
  {
    SendInput, ^{Numpad8}
  }

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

;       ;;; Minecraft - Repair Item for ATM8 - Tool on Slot 2 - Repair on Slot 5 ;;;
F15::
	Send, e
	Sleep, 50 ; Adjust the sleep duration as needed (in milliseconds)
	MouseMove, 1777, 588 ; Craft 01
	Sleep, 50 ; Adjust the sleep duration as needed (in milliseconds)
	Send, 2 ; Slot 02
	Sleep, 50
	MouseMove, 1820, 588 ; Craft 02
	Sleep, 50
	Send, 5 ; Slot 05
	Sleep, 50
	MouseMove, 1940, 564 ; Craft Output
	Sleep, 50
	Send, 2 ; Slot 02
	Sleep, 50
	Send, {Escape}
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Minecraft - Enchant 27 Books ;;;
F18::
Send, {Shift down}  ; Hold Shift key down
Sleep, 100          ; Wait for 100 milliseconds

Loop 27 {
	Click, 1434, 798    ; Click on the first specific position
	Sleep, 50           ; Wait for 50 milliseconds
	Click, 1718, 590    ; Click on the second specific position
	Sleep, 50           ; Wait for 50 milliseconds
	Click, 1470, 533    ; Click on the third specific position
	Sleep, 50           ; Wait for 50 milliseconds
}

Send, {Shift up}    ; Release Shift key
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

;       ;;; Car Sale Sim ;;;
F16::
	Click, 3189, 1401    ; Click on the first specific position
	Sleep, 20            ; Wait for 50 milliseconds
	Click, 2264, 393     ; Click on the second specific position
	Sleep, 20            ; Wait for 50 milliseconds
	Click, 1282, 1219    ; Click on the third specific position
	Sleep, 20    
Return

;-------------------------------------------------------------------------------------------


;_________________________________________________________________________________________________________________________________;
;                                                                                                                                 ;
;                                              ;;; Functions ;;;                                                                  ;    
;_________________________________________________________________________________________________________________________________;



;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Ellie's Functions ;;;                                                                   ;
;;;;-----------------------------------------------------------------------------------------------;

VirtualDesktop(LeftRight)
{
SendInput, {LWin down}{LCtrl down}{%LeftRight% down}{Lwin up}{LCtrl up}{%LeftRight% up}      ; switch virtual desktop
}



MouseClicker(LRButton,Key)
{
SendInput {%LRButton% Down} ;Press Left or Right Mouse button
KeyWait %Key% ; Wait for release
SendInput {%LRButton% Up} ; Release Left or Right Mouse button
}



MouseAutoClicker(LeftRight, Key1, Key2)
{
While GetKeyState(Key1, "P") && GetKeyState(Key2, "P")
	{
   	 Click, %LeftRight%
	 Sleep 1
	}
}

;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Toggles File Extensions Function (in Windows Explorer) ;;;                              ;
;;;;-----------------------------------------------------------------------------------------------;


;-------------------------------------------------------------------------------------------

;toggle extensions function - checks status of file extension viewing, toggles it, refreshes Explorer window.
f_ToggleFileExt()
{
Global lang_ToggleFileExt, lang_ShowFileExt, lang_HideFileExt
RootKey = HKEY_CURRENT_USER
SubKey  = Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
RegRead, HideFileExt    , % RootKey, % SubKey, HideFileExt
if HideFileExt = 1
  {
  RegWrite, REG_DWORD, % RootKey, % SubKey, HideFileExt, 0
  f_RefreshExplorer()
  }
else
{
    RegWrite, REG_DWORD, % RootKey, % SubKey, HideFileExt, 1
  f_RefreshExplorer()
}
Return
}



f_RefreshExplorer() ;refreshes explorer so you see the results
{
WinGet, id, ID, ahk_class Progman
SendMessage, 0x111, 0x1A220,,, ahk_id %id%
WinGet, id, List, ahk_class CabinetWClass
Loop, %id%
{
  id := id%A_Index%
   SendMessage, 0x111, 0x1A220,,, ahk_id %id%
}
WinGet, id, List, ahk_class ExploreWClass
Loop, %id%
{
  id := id%A_Index%
  SendMessage, 0x111, 0x1A220,,, ahk_id %id%
}
WinGet, id, List, ahk_class #32770
Loop, %id%
{
  id := id%A_Index%
  ControlGet, w_CtrID, Hwnd,, SHELLDLL_DefView1, ahk_id %id%
  if w_CtrID !=
  SendMessage, 0x111, 0x1A220,,, ahk_id %w_CtrID%
}
Return
}

;end of file extensions function

;-------------------------------------------------------------------------------------------


;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Toggles Hidden Files Function (in Windows Explorer) ;;;                                 ;
;;;;-----------------------------------------------------------------------------------------------;


;-------------------------------------------------------------------------------------------

f_ToggleHidden()
{
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden  ;checks for hidden file status and changes
If HiddenFiles_Status = 2  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
Else  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 
WinGetClass, eh_Class,A 
If (eh_Class = "#32770" OR A_OSVersion >= "WIN_VISTA") ;if your Windows OS is Vista or newer
Send, {F5} 
Else PostMessage, 0x111, 28931,,, A 
f_RefreshExplorer() ;calls the refresh command agian so you see your results
}

;end of hidden files function

;-------------------------------------------------------------------------------------------


;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Ctrl Alt S = Select Files - Add Files Names to text file ;;;                                 ;
;;;;-----------------------------------------------------------------------------------------------;


;-------------------------------------------------------------------------------------------

SelectFilesText()
{
ClipSaved := ClipboardAll ; Save the current clipboard content
Clipboard := "" ; Empty the clipboard

Send, ^c ; Copy the selected files
ClipWait, 1 ; Wait for the clipboard to contain data

if (!ErrorLevel) ; If files were copied to the clipboard
{
    ; Get the directory of the first selected file
    Loop, parse, Clipboard, `n, `r
    {
        filePath := A_LoopField ; Get the full path of the file
        SplitPath, filePath, name, dir, ext, name_no_ext, drive ; Split the path into components
        filePath := dir . "\fileList.txt" ; Create the path of the text file
        break ; We only need the directory of the first file
    }

    Loop, parse, Clipboard, `n, `r ; Loop through each file
    {
        FileAppend, %A_LoopField%`n, %filePath% ; Append the file name to the text file
    }
}

Clipboard := ClipSaved ; Restore the original clipboard content

Return
}
;end

;-------------------------------------------------------------------------------------------


;#If GetKeyState("ScrollLock", "T") ; This makes it so that everything after this line only works when the [ScrollLock] is on


;;;;-----------------------------------------------------------------------------------------------;
;      ;;; preset() Function - Directly Apply a Preset Effect to Any Clip With a Single Key ;;;    ;
;;;;-----------------------------------------------------------------------------------------------;

; preset() is my most used, and most useful AHK function! There is no good reason why Premiere doesn't have this functionality.
;keep in mind, I use 150% UI scaling, so your pixel distances for commands like mousemove WILL be different!
;to use this script yourself, carefully go through  testing the script and changing the values, ensuring that the script works, one line at a time. use message boxes to check on variables and see where the cursor is. remove those message boxes later when you have it all working!

#IfWinActive ahk_exe Adobe Premiere Pro.exe
preset(item)
{

;Keyshower(item,"preset") ;YOU DO NOT NEED THIS LINE. -- it simply displays keystrokes on the screen for the sake of tutorials...
if IsFunc("Keyshower")
	{
	Func := Func("Keyshower")
	RetVal := Func.Call(item,"preset") 
	}

ifWinNotActive ahk_exe Adobe Premiere Pro.exe
	goto theEnding ;and this line is here just in case the function is called while not inside premiere.


;Setting the coordinate mode is really important. This ensures that pixel distances are consistant for everything, everywhere.
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window

;This (temporarily) blocks the mouse and keyboard from Sending any information, which could interfere with the funcitoning of the script.
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

SetKeyDelay, 0 ;NO DELAY BETWEEN TYPED STUFF! It might actually be best to put this at "1" though.

;prFocus("timeline") ;maybe not essential i think...
SendInput, ^!+k ;shuttle STOP
sleep 10
SendInput, ^!+k ; another shortcut for Shuttle Stop. CTRL ALT SHIFT K. Set this in Premiere's shortcuts panel.
;so if the video is playing, this will stop it. Othewise, it can mess up the script.
sleep 5

;msgbox, ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
;;to check if there are lingering variables...

MouseGetPos, xposP, yposP ;------------------stores the cursor's current coordinates at X%xposP% Y%yposP%
SendInput, {mButton} ;this will MIDDLE CLICK to bring focus to the panel underneath the cursor (the timeline). I forget exactly why, but if you create a nest, and immediately try to apply a preset to it, it doesn't work, because the timeline wasn't in focus...?
;but i just tried that and it still didn't work...
sleep 5
prFocus("effects") ;brings focus to the effects panel
;Alternative -->;;Send ^+!7 ;CTRL SHIFT ALT 7 --- you must set this in premiere's keyboard shortcuts menu to the "effects" panel

sleep 15 ;"sleep" means the script will wait for 20 milliseconds before the next command. This is done to give Premiere some time to load its own things.
SendInput, ^b ;CTRL B ------------------------- set in premiere to "select find box"
sleep 5
;Send ^b ;again... actually this will create the DOODLEDE DOOO noise if you do it twice.


;Any text in the Effects panel's find box has now been highlighted. There is also a blinking "text insertion point" at the end of that text. This is the vertical blinking line, or "caret."  
if (A_CaretX = "")
{
;No Caret (blinking vertical line) can be found.
waiting2 = 0
;the following loop is waiting until it sees the caret. SUPER IMPORTANT. Without this, the function doesn't work 10% of the time.
;This is also way better than just always waiting 60 milliseconds like it had been before. The function can continue as soon as Premiere is ready.
loop
	{
	waiting2 ++
	sleep 33
	tooltip, counter = (%waiting2% * 33)`nCaret = %A_CaretX%
	if (A_CaretX <> "")
		{
		tooltip, CARET WAS FOUND
		break
		}
	if (waiting2 > 30)
		{
		tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.
		;Note to self, need much better way to debug this than screwing the user
		sleep 200
		;tooltip,
		GOTO theEnding
		}
	}
sleep 1
tooltip,
}

MouseMove, %A_CaretX%, %A_CaretY%, 0
sleep 5

;;;and fortunately, AHK knows the exact X and Y position of this caret. So therefore, we can find the effects panel find box, no matter what monitor it is on, with 100% consistency!

;tooltip, 1 - mouse should be on the caret X= %A_CaretX% Y= %A_CaretY% now ;;this was super helpful in me solving this one!

;;;msgbox, carat X Y is %A_CaretX%, %A_CaretY%
MouseGetPos, , , Window, classNN
WinGetClass, class, ahk_id %Window%
;tooltip, 2 - ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
;sleep 10 ;do i need this??
;;;I think ControlGetPos is not affected by coordmode??  Or at least, it gave me the wrong coordinates if premiere is not fullscreened... https://autohotkey.com/docs/commands/ControlGetPos.htm 
ControlGetPos, XX, YY, Width, Height, %classNN%, ahk_class %class%, SubWindow, SubWindow ;-I tried to exclude subwindows but I don't think it works...?
;;my results:  59, 1229, 252, 21,      Edit1,    ahk_class Premiere Pro

;tooltip, classNN = %classNN%
;sleep 50
;now we have found a lot of useful information about this find box. Turns out, we don't need most of it...
;we just need the X and Y coordinates of the "upper left" corner...

;comment in the following line to get a message box of your current variable values. The script will not advance until you dismiss the message box.
;MsgBox, xx=%XX% yy=%YY%

;MouseMove, XX-25, YY+10, 0 ;--------------------for 150% UI scaling, this moves the cursor onto the magnifying glass
MouseMove, XX-15, YY+10, 0 ;--------------------for 100% UI scaling, this moves the cursor onto the magnifying glass
;msgbox, should be in the center of the magnifying glass now.
sleep 5 ;was sleep 50
;This types in the text you wanted to search for. Like "pop in." We can do this because the entire find box text was already selected by Premiere. Otherwise, we could click the magnifying glass if we wanted to , in order to select that find box.
Send %item%

sleep 5
;MouseMove, 62, 95, 0, R ;----------------------(for 150% UI) relative to the position of the magnifying glass (established earlier,) this moves the cursor down and directly onto the preset's icon. In my case, it is inside the "presets" folder, then inside of another folder, and the written name should be completely unique so that it is the first and only item.
MouseMove, 41, 63, 0, R ;----------------------(for 100% UI) 
;msgbox, The cursor should be directly on top of the preset's icon. `n If not, the script needs modification.
sleep 5
MouseGetPos, iconX, iconY, Window, classNN ;---now we have to figure out the ahk_class of the current panel we are on. It used to be DroverLord - Window Class14, but the number changes anytime you move panels around... so i must always obtain the information anew.
sleep 5
WinGetClass, class, ahk_id %Window% ;----------"ahk_id %Window%" is important for SOME REASON. if you delete it, this doesn't work.
;tooltip, ahk_class =   %class% `nClassNN =     %classNN% `nTitle= %Window%
;sleep 50
ControlGetPos, xxx, yyy, www, hhh, %classNN%, ahk_class %class%, SubWindow, SubWindow ;-I tried to exclude subwindows but I don't think it works...?
MouseMove, www/4, hhh/2, 0, R ;-----------------moves to roughly the CENTER of the Effects panel. This clears the displayed presets from any duplication errors. VERY important. without this, the script fails 20% of the time. This is also where the script can go wrong, by trying to do this on the timeline, meaning it didn't get the Effects panel window information as it should have... IDK how to fix yet.
sleep 5
MouseClick, left, , , 1 ;-----------------------the actual click
sleep 5
MouseMove, iconX, iconY, 0 ;--------------------moves cursor BACK onto the effect's icon
;tooltip, should be back on the effect's icon
;sleep 50
sleep 5
MouseClickDrag, Left, , , %xposP%, %yposP%, 0 ;---clicks the left button down, drags this effect to the cursor's pervious coordinates and releases the left mouse button, which should be above a clip, on the TIMELINE panel.
sleep 5
MouseClick, middle, , , 1 ;this Returns focus to the panel the cursor is hovering above, WITHOUT selecting anything. great!
blockinput, MouseMoveOff ;Returning mouse movement ability
BlockInput, off ;do not comment out or delete this line -- or you won't regain control of the keyboard!! However, CTRL+ALT+DEL will still work if you get stuck!! Cool.

;remove the following thingy if it makes no sense to you
IfInString, item, CROP
{
	if IsFunc("cropClick") {
		Func := Func("cropClick")
		sleep 160 ;because it might take awhile to appear in Premiere
		sleep 160 ;because it might take awhile to appear in Premiere
		RetVal := Func.Call() 
		}
	; sleep 160
	; cropClick()
	; ;msgbox, that had "CROP" in it.
}
;remove the above thingy if it makes no sense to you

theEnding:
}
;END of preset()





;;;;------------------------------------------------------------------------------------------------------------------------
;      ;;; prFocus(panel) Function - Focuses one panel in premiere with a function ;;;                                     ;
;;;;------------------------------------------------------------------------------------------------------------------------

prFocus(panel) ;this function allows you to have ONE spot where you define your personal shortcuts that "focus" panels in premiere.
{
Send ^!+7 ;bring focus to the effects panel, in order to "clear" the current focus on the MAIN monitor
sleep 12
Send ^!+7 ;do it AGAIN, just in case a panel was full-screened... it would only have exited full screen, and not switched to the effects panel as it should have.
sleep 7
if (panel = "effects")
	goto theEnd ;Send ^!+7 ;do nothing. the shortcut has already been pressed.
else if (panel = "timeline")
	Send ^!+3 ;if focus had already been on the timeline, this would have switched to the next sequence in some arbitrary order.
else if (panel = "program") ;program monitor
	Send ^!+4
else if (panel = "source") ;source monitor
{
	Send ^!+2
	;tippy("Send ^!+2")
}
else if (panel = "project") ;AKA a "bin" or "folder"
	Send ^!+1
else if (panel = "effect controls")
	Send ^!+5

theEnd:

}
;END of prFocus()
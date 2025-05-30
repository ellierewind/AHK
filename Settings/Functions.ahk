;_________________________________________________________________________________________________________________________________;
;                                                                                                                                 ;
;                                              ;;; Functions ;;;                                                                  ;    
;_________________________________________________________________________________________________________________________________;



;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Ellie's Functions ;;;                                                                   ;
;;;;-----------------------------------------------------------------------------------------------;

;-------------------------------------------------------------------------------------------

VirtualDesktop(LeftRight)
{
SendInput, {LWin down}{LCtrl down}{%LeftRight% down}{Lwin up}{LCtrl up}{%LeftRight% up} ; Switch Virtual Desktop
}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

MouseClicker(LRButton, Key)
{
SendInput {%LRButton% Down} ; Press Left or Right Mouse button
KeyWait %Key%               ; Wait for release
SendInput {%LRButton% Up}   ; Release Left or Right Mouse button
}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

MouseAutoClicker(LeftRight, Key1, Key2, HowFast)
{
While GetKeyState(Key1, "P") && GetKeyState(Key2, "P")
	{
   	 Click, %LeftRight%
	 Sleep  %HowFast%
	}
}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

SendTimeDate(DateTimeFormat)
{
	FormatTime, CurrentDateTime,, %DateTimeFormat%
	Send %CurrentDateTime%
}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

MPCZoomer(Zoom, UpPos, DownPos, LeftPos, RightPos)
{
	; Send Numpad9 x times - Zooms in using MPC-HC
	Loop, %Zoom%
		{
		  SendInput, {Numpad9}
		}
	  
		; Send Ctrl+Numpad8 x times - Pans up using MPC-HC
		Loop, %UpPos%
		{
		  SendInput, ^{Numpad8}
		}
		
		; Send Ctrl+Numpad2 x times - Pans down using MPC-HC
		Loop, %DownPos%
		{
		  SendInput, ^{Numpad2}
		}
		
		; Send Ctrl+Numpad4 x times - Pans left using MPC-HC
		Loop, %LeftPos%
		{
		  SendInput, ^{Numpad4}
		}
		
		; Send Ctrl+Numpad6 x times - Pans right using MPC-HC
		Loop, %RightPos%
		{
		  SendInput, ^{Numpad6}
		}
}

;-------------------------------------------------------------------------------------------


;;;;-----------------------------------------------------------------------------------------------;
;      ;;; Ellie's Gaming Functions ;;;                                                            ;
;;;;-----------------------------------------------------------------------------------------------;

;-------------------------------------------------------------------------------------------

; The pixel coords are for a 3440x1440 screen
; Minecraft is in maximized windowed mode
; GUI Scale is set to 3x

;-------------------------------------------------------------------------------------------

;-------------------------------------------------------------------------------------------

MCAutoCraft(ItemName, LoopTimes, HowFast)             ; Inspired by Xisuma!
{	
	PixelGetColor, color1, 2045, 571                  ; Coords of 3x3 Craft Output Border when CraftBook is Open
	PixelGetColor, color2, 1812, 578                  ; Coords of 3x3 Craft Output Border when CraftBook is Closed

	if (color1 = "0x373737") || (color2 = "0x373737") ; Color of 3x3 Craft Output Border
		{
			PixelGetColor, color3, 1529, 568          ; Coords of CraftBook When Closed

			if (color3 = "0x000000")
				{
					Click, 1529, 568                  ; Click on CraftBook
					Sleep %HowFast%
				}

				Click, 1336, 518                      ; Click on Search Box
				Sleep, %HowFast%
				
				if (ItemName != "") {                 ; Only clear and type if ItemName is not empty
					Send, ^a {Backspace}              ; Selects and Deletes All Text in Search Box
					Sleep, %HowFast%
					Send, %ItemName%                  ; Types in Item Name
					Sleep, %HowFast%
				}
	
				Loop, %LoopTimes%
					{
						SendInput, {Shift down}       ; Hold Shift key down
						Click, 1308, 585              ; Click on First Item in Craft Book Menu
						Sleep, %HowFast%
						Click, 2081, 584              ; Click on 3x3 Craft Output
						SendInput, {Shift up}         ; Release Shift key
					}
		}
}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

MCEnchant(LoopTimes, HowFast)
{

	PixelGetColor, color, 1498, 609                   ; Coords of enchanted item slot border

	if (color = "0x373737")                           ; Color of enchanted item slot border
		{
			SendInput, {Shift down}                   ; Hold Shift key down
			Sleep, 100
			Click, 1559, 906                          ; Click on item on Hotbar2
			Loop %LoopTimes%
				{
				Click, 1505, 906                      ; Click on item on Hotbar1
				Sleep, %HowFast%
				Click, 1658, 633                      ; Click on enchantment
				Sleep, %HowFast%
				Click, 1528, 621                      ; Click on enchanted item
				Sleep, %HowFast%
				}
			SendInput, {Shift up}                     ; Release Shift key
		} 

}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

MCRepairItem(SlotX, SlotY, LoopTimes, HowFast)
{
	PixelGetColor, color, 1914, 589                   ; Coords of 2x2 Craft Output

	if (color = "0x373737")                           ; Color of 2x2 Craft Output
	Loop %LoopTimes%
		{
			;Send, e                                  ; Opens Inventory
			;Sleep, %HowFast%
			MouseMove, 1777, 588                      ; CraftSlot 01
			Sleep, 50
			Send, %SlotX%                             ; SlotX
			Sleep, %HowFast%
			MouseMove, 1820, 588                      ; CraftSlot 02
			Sleep, %HowFast%
			Send, %SlotY%                             ; SlotY
			Sleep, %HowFast%
			MouseMove, 1940, 564                      ; Craft Output
			Sleep, %HowFast%
			Send, %SlotX%                             ; SlotX
			Sleep, %HowFast%
			Send, {Escape}
		}

}

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

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
;      ;;; Ctrl Alt S = Select Files - Add Files Names to text file ;;;                            ;
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



;;;;-----------------------------------------------------------------------------------------------;
;      ;;; preset() Function - Directly Apply a Preset Effect to Any Clip With a Single Key ;;;    ;
;;;;-----------------------------------------------------------------------------------------------;

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
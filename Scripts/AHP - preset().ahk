;;;;-----------------------------------------------------------------------------------------------;
;                            ;;;<Prerequisites>;;;                                                ;
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


preset(A_Args[1])
ExitApp



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
MouseClickDrag, Left, , , A_Args[2], A_Args[3], 0 ;---clicks the left button down, drags this effect to the cursor's pervious coordinates and releases the left mouse button, which should be above a clip, on the TIMELINE panel.
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
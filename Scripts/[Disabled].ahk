;-------------------------------------------------------------------

;       ;;; Replaces NumpadAdd to open Task Manager ;;;
;NumpadAdd::^+Esc
;return

;#NumpadAdd::sendraw +
;return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [TBD]] Adds "\" as a modifier ;;;
;Ctrl & \:: send \ ; Ctrl  + [\] outputs [/]

;\ & ]:: sendevent {LWin down}{LCtrl down}{Right down}{LWin up}{LCtrl up}{Right up} ; Switch to the Next     Virtual Desktop
;\ & [:: sendevent {LWin down}{LCtrl down}{Left down}{LWin up}{LCtrl up}{Right up}  ; Switch to the Previous Virtual Desktop
;\ & -::send {Volume_Down} ; Volume Down
;\ & +::send {Volume_Up} ;  Volume Up
;\ & 0::send {Volume_Mute} ; Volume Mute

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [/] & [*])] Change Audio Output using NumpadDiv [/] and NumpadMult [*] ;;;
;NumpadDiv:: ; Switches to Speakers/Monitor Audio Output
;  toggle:=!toggle ;toggles up and down states. 
;  Run, mmsys.cpl 
;  WinWait,Sound ; Change "Sound" to the name of the window in your local language 
;    ControlSend,SysListView321,{Down 2} ; This number selects the matching audio device in the list, change it accordingly 
;  ControlClick,&Set Default ; Change "&Set Default" to the name of the button in your local language 
;  ControlClick,OK 
;return

;NumpadMult:: ; Switches to Headphones Audio Output
;  toggle:=!toggle ;toggles up and down states. 
;  Run, mmsys.cpl 
;  WinWait,Sound ; Change "Sound" to the name of the window in your local language 
;    ControlSend,SysListView321,{Down 1} ; This number selects the matching audio device in the list, change it accordingly 
;  ControlClick,&Set Default ; Change "&Set Default" to the name of the button in your local language 
;  ControlClick,OK 
;return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [Z])] Open File Explorer using F1 ;;;
;F1::
;IfWinNotExist, ahk_class CabinetWClass
;	Run, explorer.exe
;GroupAdd, explorers, ahk_class CabinetWClass
;if WinActive("ahk_exe explorer.exe")
;	GroupActivate, explorers, r
;else
;	WinActivate ahk_class CabinetWClass
;Return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [X])] Open Google Chrome using F2 ;;;
;F2::
;IfWinNotExist, ahk_class Chrome_WidgetWin_1
;	Run, chrome.exe
;if WinActive("ahk_class Chrome_WidgetWin_1")
;	Send ^{tab} ; Switches Tab (Ctrl + Tab) each time you press F2
;else
;	WinActivate ahk_class Chrome_WidgetWin_1
;Return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [,])] Open After Effects using F3 ;;;
;F3::
;IfWinNotExist, ahk_exe AfterFX.exe
;	Run, AfterFX.exe
;WinActivate ahk_exe AfterFX.exe
;Return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [.])] Open Premiere Pro using F4 ;;;
;F4::
;IfWinNotExist, ahk_exe Adobe Premiere Pro.exe
;	Run, Adobe Premiere Pro.exe
;WinActivate ahk_exe Adobe Premiere Pro.exe
;Return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Moved to Second Keyboard [/])] Open Photoshop using F6 ;;;
;F6::
;IfWinNotExist, ahk_exe Photoshop.exe
;	Run, Photoshop.exe
;WinActivate ahk_exe Photoshop.exe
;Return

;-------------------------------------------------------------------

;-------------------------------------------------------------------

;       ;;; [Disabled (Reason: Not Currently Useful])] Replaces Right Windows Key as AppsKey ;;;
;RWin::AppsKey

;-------------------------------------------------------------------


;__________________________________________________________________________________________;
;                                                                                          ;
;                               ;;; Old & Unused ;;;                                       ;    
;__________________________________________________________________________________________;



; ; Define hotkey Alt+Shift+T (^!t) to convert the clipboard text to title case (capitalize first letter of each word)
; F1:: ; Ctrl+Alt+Shift+T
;     clipboard := ""            ; Clear the clipboard first
;     send ^{c}                  ; Send Ctrl+C to copy the selected text to the clipboard
;     clipWait, 0.3              ; Wait up to 0.3 seconds for the clipboard to have content
;     stringLower, clipboard, clipboard ; Convert the clipboard text to lowercase
;     stringUpper, clipboard, clipboard, T ; Convert the first letter of each word to uppercase
;     send ^{v}                  ; Send Ctrl+V to paste the modified clipboard content
;     return


; F23::
; MouseClicker("LButton", "F23") ; (LRButton, Key) F23 as LeftClick
; Return

; F22::
; MouseClicker("RButton", "F22") ; (LRButton, Key) F22 as RightClick
; Return


; F24 & F23::
; MouseAutoClicker("Left",  "F24", "F23", 1) ; (LeftRight, Key1, Key2, HowFast) F24 + F23 as Auto LeftClick
; return

; F24 & F22::
; MouseAutoClicker("Right", "F24", "F22", 1) ; (LeftRight, Key1, Key2, HowFast) F24 + F23 as Auto RightClick
; return


;------------------------------------------------------------------------------------------------------------------

;       ;;; Replaces the Pause key to Windows Key + D  [Show Desktop in mpc-hc] ;;;

; #IfWinNotActive, ahk_class MediaPlayerClassicW ; Disables this hotkey when mpc-hc is in focus
; Pause::#d
; #IfWinNotActive
; Return

;------------------------------------------------------------------------------------------------------------------
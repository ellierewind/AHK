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
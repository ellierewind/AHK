#IfWinActive
#IfWinActive

;-------------------------------------------------------------------------------------------

:*:/rel::                     ; Hotstring to reload the script
Reload
Return

:*:/git::                     ; Hotstring to open GitHub Desktop
Run, C:\Users\%A_UserName%\AppData\Local\GitHubDesktop\GitHubDesktop.exe
Return

:*:/cst::                     ; Hotstring to change timezone to CST
Run %A_ScriptDir%\Scripts\ChangeTimezones\cst.bat
Return

:*:/est::                     ; Hotstring to change timezone to EST
Run %A_ScriptDir%\Scripts\ChangeTimezones\est.bat
Return

:*:/pst::                     ; Hotstring to change timezone to PST
Run %A_ScriptDir%\Scripts\ChangeTimezones\pst.bat
Return

:*:/pht::                     ; Hotstring to change timezone to PHT
Run %A_ScriptDir%\Scripts\ChangeTimezones\pht.bat
Return

::@@::                        ; Hotstring to type email address
Send, ellierewind@gmail.com
Return

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

#IfWinActive ahk_exe chrome.exe                                                      ; For Google Chrome

::/com::                                                                             ; Hotstring for creating a comment with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b%CurrentDateTime% - Ellie's Comment:^+h^b{Shift}+{Enter}                  ; Send formatted comment with bold text and timestamp
Return

::/close:: ; Hotstring for creating a closing comment
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b%CurrentDateTime% - Ellie's Comment:^+h^b{Shift}+{Enter}
Sleep, 500
Send, Closing this ticket.
Return

::/rep::                                                                             ; Hotstring for creating a reply with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b%CurrentDateTime% - Ellie's Reply:^+h^b{Shift}+{Enter}                    ; Send formatted reply with bold text and timestamp
Return

::/cust::                                                                            ; Hotstring for creating a reply with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^b^i^u%CurrentDateTime% - Customer's Message:^b^i^u{Shift}+{Enter}             ; Send formatted reply with bold text and timestamp
Return

::/act::                                                                             ; Hotstring for creating an action item with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b%CurrentDateTime% - Ellie's Action Needed:^+h^b{Shift}+{Enter}            ; Send formatted action with bold text and timestamp
Return

::/feed::                                                                            ; Hotstring for creating feedback with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b%CurrentDateTime% - Ellie's Feedback:^+h^b{Shift}+{Enter}                 ; Send formatted feedback with bold text and timestamp
Return

::/start::                                                                           ; Hotstring for creating start/end markers
Send, <Start>{Shift}+{Enter}{Shift}+{Enter}{Shift}+{Enter}{Shift}+{Enter}<End>       ; Insert start/end markers with spacing
Return

#IfWinActive                                                                         ; Ends the Google Chrome section

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

#IfWinActive ahk_exe chrome.exe                                                       ; For Google Chrome

::/tcom::                                                                             ; Hotstring for creating a comment without timestamp
Send, ^+h^bEllie's Comment:^+h^b{Shift}+{Enter}                                       ; Send formatted comment with bold text
Return

::/trep::                                                                             ; Hotstring for creating a reply without timestamp
Send, ^+h^bEllie's Reply:^+h^b{Shift}+{Enter}                                         ; Send formatted reply with bold text
Return

::/tact::                                                                             ; Hotstring for creating an action without timestamp
Send, ^+h^bEllie's Action Needed:^+h^b{Shift}+{Enter}                                 ; Send formatted action with bold text
Return

#IfWinActive                                                                          ; Ends the Google Chrome section

;-------------------------------------------------------------------------------------------



;-------------------------------------------------------------------------------------------

#IfWinActive ahk_class AutoHotkeyGUI ; For CapsLock Menu

:*:rpcl::
Send, rpclipsgta{enter}
Return

:*:gamingl::
Send, gamingleaksandrumours{enter}
Return

:*:games::
Send, games{enter}
Return

:*:ocul::
Send, oculusquest{enter}
Return

:*:visi::
Send, visionpro{enter}
Return

:*:manga::
Send, manga{enter}
Return

:*:anime::
Send, anime{enter}
Return

:*:hard::
Send, hardware{enter}
Return

#IfWinActive

;-------------------------------------------------------------------------------------------
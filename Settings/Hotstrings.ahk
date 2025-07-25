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
Send, ^+h^b^i^u%CurrentDateTime% - Ellie's Comment:^+h^b^i^u{Shift}+{Enter}          ; Send formatted comment with bold text and timestamp
Return

::/close:: ; Hotstring for creating a closing comment
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b^i^u%CurrentDateTime% - Ellie's Comment:^+h^b^i^u{Shift}+{Enter}
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
Send, ^+h^b^i^u%CurrentDateTime% - Ellie's Action Needed:^+h^b^i^u{Shift}+{Enter}    ; Send formatted action with bold text and timestamp
Return

::/feed::                                                                            ; Hotstring for creating feedback with timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd - hh:mm tt                                  ; Get current date and time in specific format
Send, ^+h^b^i^u%CurrentDateTime% - Ellie's Feedback:^+h^b^i^u{Shift}+{Enter}         ; Send formatted feedback with bold text and timestamp
Return

NotionRemindAt(Time) {
    Sleep 200
    Send, {BackSpace}
    Sleep 250
    Send, @remind %Time%
    Sleep 250
    Send, {Enter}
    Return
}

:*:@12am::
NotionRemindAt("12am")
Return

:*:@1am::
NotionRemindAt("1am")
Return

:*:@2am::
NotionRemindAt("2am")
Return

:*:@3am::
NotionRemindAt("3am")
Return

:*:@4am::
NotionRemindAt("4am")
Return

:*:@5am::
NotionRemindAt("5am")
Return

:*:@6am::
NotionRemindAt("6am")
Return

:*:@7am::
NotionRemindAt("7am")
Return

:*:@8am::
NotionRemindAt("8am")
Return

:*:@9am::
NotionRemindAt("9am")
Return

:*:@10am::
NotionRemindAt("10am")
Return

:*:@11am::
NotionRemindAt("11am")
Return

:*:@12pm::
NotionRemindAt("12pm")
Return

:*:@1pm::
NotionRemindAt("1pm")
Return

:*:@2pm::
NotionRemindAt("2pm")
Return

:*:@3pm::
NotionRemindAt("3pm")
Return

:*:@4pm::
NotionRemindAt("4pm")
Return

:*:@5pm::
NotionRemindAt("5pm")
Return

:*:@6pm::
NotionRemindAt("6pm")
Return

:*:@7pm::
NotionRemindAt("7pm")
Return

:*:@8pm::
NotionRemindAt("8pm")
Return

:*:@9pm::
NotionRemindAt("9pm")
Return

:*:@10pm::
NotionRemindAt("10pm")
Return

:*:@11pm::
NotionRemindAt("11pm")
Return

:*:@tom::
NotionRemindAt("tomorrow")
Return

:*:@mon::
NotionRemindAt("next monday")
Return

:*:@tues::
NotionRemindAt("next tuesday")
Return

:*:@wed::
NotionRemindAt("next wednesday")
Return

:*:@thurs::
NotionRemindAt("next thursday")
Return

:*:@fri::
NotionRemindAt("next friday")
Return

:*:@sat::
NotionRemindAt("next saturday")
Return

:*:@sun::
NotionRemindAt("next sunday")
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

:*:neur::
Send, neurosama{enter}
Return

#IfWinActive

;-------------------------------------------------------------------------------------------
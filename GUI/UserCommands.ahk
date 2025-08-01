;-------------------------------------------------------------------------------
;;; SEARCH ;;;
;-------------------------------------------------------------------------------
if UserCommands = y%A_Space% ; Search Youtube in Incognito
{
    gui_search_title = Search Youtube
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://www.youtube.com/results?search_query=REPLACEME")
}

else if UserCommands = nyaa%A_Space% ; Search Anime on Nyaa.si
{
    gui_search_title = nyaa.si - Anime
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://nyaa.si/?f=0&c=1_2&q=REPLACEME")
}

else if UserCommands = mangadex%A_Space% ; Search Manga on Mangadex
{
    gui_search_title = MangaDex - Manga
    gui_search("https://mangadex.org/titles?q=REPLACEME")
}

else if UserCommands = manga%A_Space% ; Search for Manga on Comick.io
{
    gui_search_title := "Comick.io - Manga search"
    gui_search("https://comick.io/search?q=REPLACEME")
}

else if UserCommands = timewas ; What time was x ago
{
    gui_search_title = What time was x
    gui_search("https://www.google.com/search?q=what+time+was+REPLACEME+ago")
}

; else if UserCommands = ani%A_Space% ; Search an /r/anime discussion
; {
;     gui_search_title := "/r/Anime discussion search"
;     gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://new.reddit.com/search/?q=author%3Aautolovepon%20REPLACEME&type=posts&sort=new")
; }

; else if UserCommands = url%A_Space% ; Search a URL reddit discussion{
; {    
;     gui_search_title := "URL reddit discussion search"
;     gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://new.reddit.com/search/?q=url%3AREPLACEME")
; }

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------

; else if UserCommands = r%A_Space% ; Go to a subreddit.
; {
;     gui_search_title := "/r/"
;     gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://new.reddit.com/r/REPLACEME")
; }

else if UserCommands = git ; Open GitHub Desktop
{
    gui_destroy()
    Run C:\Users\%A_UserName%\AppData\Local\GitHubDesktop\GitHubDesktop.exe
}
;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------

else if UserCommands = desk ; Opens Desktop Folder
{
    gui_destroy()
    Run, C:\Users\%A_UserName%\Desktop
}

else if UserCommands = down ; Opens Downloads Folder
{
    gui_destroy()
    Run, C:\Users\%A_UserName%\Downloads
}

else if UserCommands = rec%A_Space% ; Opens Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}

else if UserCommands = start ; Opens Startup Folder
{
    gui_destroy()
    Run, shell:startup
}

;-------------------------------------------------------------------------------
;;; SCRIPTS ;;;
;-------------------------------------------------------------------------------

else if UserCommands = ext ; Toggles File Extensions (in Windows Explorer)
{
    gui_destroy()
    f_ToggleFileExt()
}

else if UserCommands = hid ; Toggles Hidden Files
{
    
    gui_destroy()
    f_ToggleHidden()
}

else if UserCommands = cst ; Changes Timezone to CST
{
    gui_destroy()
    run, %A_ScriptDir%\Scripts\ChangeTimezones\cst.bat
}

else if UserCommands = est ; Changes Timezone to EST
{
    gui_destroy()
    Run %A_ScriptDir%\Scripts\ChangeTimezones\est.bat
}

else if UserCommands = pst ; Changes Timezone to PST
{
    gui_destroy()
     Run %A_ScriptDir%\Scripts\ChangeTimezones\pst.bat
}

else if UserCommands = pht ; Changes Timezone to PHT
{
    gui_destroy()
    Run %A_ScriptDir%\Scripts\ChangeTimezones\pht.bat
}

;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------

else if UserCommands = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}

else if UserCommands = dir ; Open the directory for this script
{
    gui_destroy()
    run, %A_ScriptDir%
}

else if UserCommands = host ; Edit host script
{
    gui_destroy()
    run, %VSCode% "%A_ScriptFullPath%"
}

else if UserCommands = user ; Edit GUI user commands
{
    gui_destroy()
    run, %VSCode% "%A_ScriptDir%\GUI\UserCommands.ahk"
}


else if UserCommands = com ; Edit GUI user commands
{
    gui_destroy()
    run, %VSCode% "%A_ScriptDir%\GUI\UserCommands.ahk"
}

else if UserCommands = hot ; Edit GUI user commands
{
    gui_destroy()
    run, %VSCode% "%A_ScriptDir%\Settings\Hotstrings.ahk"
}

else if UserCommands = func ; Edit GUI user commands
{
    gui_destroy()
    run, %VSCode% "%A_ScriptDir%\Settings\Functions.ahk"
}

else if UserCommands = ? ; Tooltip with list of commands
{
    GuiControl,, UserCommands, ; Clear the input box
    Gosub, gui_commandlibrary
}    

;-------------------------------------------------------------------------------
;;; SEARCH THE WEB ;;;
;-------------------------------------------------------------------------------

else if UserCommands = g%A_Space% ; Search Google
{
    gui_search_title = Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if UserCommands = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}

else if UserCommands = toggle ; Toggle auto-brackets
{
    gui_destroy()
    global AutoBracketsEnabled
    AutoBracketsEnabled := !AutoBracketsEnabled
    TrayTip, Auto-Brackets, % (AutoBracketsEnabled ? "Enabled" : "Disabled"), 2

    #If AutoBracketsEnabled
    +[::SendInput, {`{}{`}}{Left}      ; Shift + [: Types {} and puts cursor between them
    +9::SendInput, (){Left}            ; Shift + 9: Types () and puts cursor between them
    [::SendInput, []{Left}             ; [: Types [] and puts cursor between them
    <::SendInput, <>{}{Left}           ; <: Types <> and puts cursor between them
    "::SendInput, ""{Left}              ; ": Types "" and puts cursor between them
    '::SendInput, ''{Left}              ; ': Types ' and puts cursor between them
    #If
}
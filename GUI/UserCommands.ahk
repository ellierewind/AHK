;-------------------------------------------------------------------------------
;;; SEARCH THE WEB ;;;
;-------------------------------------------------------------------------------

if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = x%A_Space% ; Search Google as Incognito
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

;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------

else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://www.youtube.com/results?search_query=REPLACEME")
}
else if Pedersen = nyaa%A_Space% ; Search Anime on Nyaa.si
{
    gui_search_title = nyaa.si - Anime
    gui_search("C:\Program Files\Google\Chrome\Application\chrome.exe -incognito https://nyaa.si/?f=0&c=1_2&q=REPLACEME")
}
else if Pedersen = mangadex%A_Space% ; Search Manga on Mangadex
{
    gui_search_title = MangaDex - Manga
    gui_search("https://mangadex.org/titles?q=REPLACEME")
}
else if Pedersen = qwe ; What time was x ago
{
    gui_search_title = What time was x
    gui_search("https://www.google.com/search?q=what+time+was+REPLACEME+ago")
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------

else if Pedersen = r%A_Space% ; Go to a subreddit.
{
    gui_search_title := "/r/"
    gui_search("https://new.reddit.com/r/REPLACEME")
}
else if Pedersen = ani%A_Space% ; Search an /r/Anime discussion
    {
        gui_search_title := "/r/Anime discussion search"
        gui_search("https://new.reddit.com/search/?q=author%3Aautolovepon%20REPLACEME&type=posts&sort=new")
    }
else if Pedersen = manga%A_Space% ; Search an /r/Anime discussion
    {
        gui_search_title := "/r/manga discussion search"
        gui_search("https://www.reddit.com/r/manga/search/?q=REPLACEME")
    }
else if Pedersen = url%A_Space% ; Search a URL reddit discussion
    {
        gui_search_title := "URL reddit discussion search"
        gui_search("https://new.reddit.com/search/?q=url%3AREPLACEME")
    }
else if Pedersen = t%A_Space% ; Go to a twitter profile.
{
    gui_search_title := "Twitter @"
    gui_search("https://twitter.com/REPLACEME/with_replies")
} 
else if Pedersen = git ; Open GitHub Desktop
{
    gui_destroy()
    Run C:\Users\%A_UserName%\AppData\Local\GitHubDesktop\GitHubDesktop.exe
}




;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------

else if Pedersen = desk%A_Space% ; Opens Desktop Folder
{
    gui_destroy()
    Run, C:\Users\%A_UserName%\Desktop
}
else if Pedersen = down%A_Space% ; Opens Downloads Folder
{
    gui_destroy()
    Run, C:\Users\%A_UserName%\Downloads
}
else if Pedersen = rec%A_Space% ; Opens Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}

;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------

else if Pedersen = ext ; Toggles File Extensions (in Windows Explorer)
{
    gui_destroy()
    f_ToggleFileExt()
}
else if Pedersen = hid ; Toggles Hidden Files
{
    
    gui_destroy()
    f_ToggleHidden()
}
else if Pedersen = cst ; Changes Timezone to CST
{
    gui_destroy()
    run, %A_ScriptDir%\Scripts\ChangeTimezones\cst.bat
}
else if Pedersen = est ; Changes Timezone to EST
{
    gui_destroy()
    Run %A_ScriptDir%\Scripts\ChangeTimezones\est.bat
}
else if Pedersen = pst ; Changes Timezone to PST
{
    gui_destroy()
     Run %A_ScriptDir%\Scripts\ChangeTimezones\pst.bat
}
else if Pedersen = pht ; Changes Timezone to PHT
{
    gui_destroy()
    Run %A_ScriptDir%\Scripts\ChangeTimezones\pht.bat
}

;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------

else if Pedersen = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if Pedersen = dir ; Open the directory for this script
{
    gui_destroy()
    run, %A_ScriptDir%
}
else if Pedersen = host ; Edit host script
{
    gui_destroy()
    run, "C:\Users\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%A_ScriptFullPath%"
}
else if Pedersen = user ; Edit GUI user commands
{
    gui_destroy()
    run, "C:\Users\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%A_ScriptDir%\GUI\UserCommands.ahk"
}
else if Pedersen = hot ; Edit GUI user commands
    {
        gui_destroy()
        run, "C:\Users\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%A_ScriptDir%\Settings\Hotstrings.ahk"
    }
else if Pedersen = func ; Edit GUI user commands
    {
        gui_destroy()
        run, "C:\Users\%A_UserName%\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%A_ScriptDir%\Settings\Functions.ahk"
    }
else if Pedersen = ? ; Tooltip with list of commands
{
    GuiControl,, Pedersen, ; Clear the input box
    Gosub, gui_commandlibrary
}    
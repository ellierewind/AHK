;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if Pedersen = g%A_Space% ; Search Google
{
    gui_search_title = Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if Pedersen = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if Pedersen = m%A_Space% ; Open more than one URL
{
    gui_search_title = Search with Google, Bing, and DuckDuckGo
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
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
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}
else if Pedersen = z%A_Space% ; Go to a website as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Open a website in Incognito Mode
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito REPLACEME.com")
}

;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------

else if Pedersen = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if Pedersen = nyaa%A_Space% ; Search Anime on Nyaa.si
{
    gui_search_title = nyaa.si - Anime
    gui_search("https://nyaa.si/?q=REPLACEME")
}
else if Pedersen = manga%A_Space% ; Search Manga on Mangadex
{
    gui_search_title = MangaDex - Manga
    gui_search("https://mangadex.org/titles?q=REPLACEME")
}
else if Pedersen = engjap ; Translate English to Japanese
{
    gui_search_title = English to Japanese
    gui_search("https://translate.google.com/#en/ja/REPLACEME")
}
else if Pedersen = japeng ; Translate Japanese to English
{
    gui_search_title = Japanese to English
    gui_search("https://translate.google.com/#ja/en/REPLACEME")
}
else if Pedersen = qwe ; What time was x ago
{
    gui_search_title = What time was x
    gui_search("https://www.google.com/search?q=what+time+was+REPLACEME+ago")
}

;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if Pedersen = r%A_Space% ; Go to a subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://new.reddit.com/r/REPLACEME")
}
else if Pedersen = yt ; Go to the YouTube Home Page
{
    gui_destroy()
    run https://www.youtube.com/
}
else if Pedersen = sub ; Go to the YouTube Subsciptions Feed
{
    gui_destroy()
    run https://www.youtube.com/feed/subscriptions
}
else if Pedersen = red ; reddit.com
{
    gui_destroy()
    run new.reddit.com
}
else if Pedersen = calc ; Calculator
{
    gui_destroy()
    run calc
}
else if Pedersen = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run %ClipBoard%
}

;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = rel%A_Space% ; Reload this script
    {
        gui_destroy() ; removes the GUI even when the reload fails
        Reload
    }
else if Pedersen = dir ; Open the directory for this script
    {
        gui_destroy()
        Run, %A_ScriptDir%
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

;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if Pedersen = name%A_Space% ; Name
    {
        gui_destroy()
        Send, Ellie
    }
else if Pedersen = clip%A_Space% ; Paste clipboard content without formatting
    {
        gui_destroy()
        SendRaw, %ClipBoard%
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
else if Pedersen = cst ; Changes Timezone to CST
    {
        gui_destroy()
        run, %A_ScriptDir%\Miscellaneous\cst.bat
    }
else if Pedersen = est ; Changes Timezone to EST
    {
        gui_destroy()
        Run %A_ScriptDir%\Miscellaneous\est.bat
    }
else if Pedersen = pst ; Changes Timezone to PST
    {
        gui_destroy()
        Run %A_ScriptDir%\Miscellaneous\pst.bat
    }
else if Pedersen = pht ; Changes Timezone to PHT
    {
        gui_destroy()
        Run %A_ScriptDir%\Miscellaneous\pht.bat
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
else if Pedersen = ping ; Ping Google
    {
        gui_destroy()
        Run, cmd /K "ping www.google.com"
    }
else if Pedersen = ? ; Tooltip with list of commands
    {
        GuiControl,, Pedersen, ; Clear the input box
        Gosub, gui_commandlibrary
    }    

;-------------------------------------------------------------------------------
;;; Volume Set ;;;
;-------------------------------------------------------------------------------
else if Pedersen = v0 ; volume set to 0
        {
            gui_destroy()
            SoundSet, 0
        }
else if Pedersen = v10 ; volume set to 10
        {
            gui_destroy()
            SoundSet, 10
        }
else if Pedersen = v15 ; volume set to 15
        {
            gui_destroy()
            SoundSet, 15
        }
else if Pedersen = v20 ; volume set to 20
        {
            gui_destroy()
            SoundSet, 20
        }
else if Pedersen = v25 ; volume set to 25
        {
            gui_destroy()
            SoundSet, 25
        }
else if Pedersen = v30 ; volume set to 30
        {
            gui_destroy()
            SoundSet, 30
        }
else if Pedersen = v40 ; volume set to 40
        {
            gui_destroy()
            SoundSet, 40
        }
else if Pedersen = v45 ; volume set to 45
        {
            gui_destroy()
            SoundSet, 45
        }
else if Pedersen = v50 ; volume set to 50
        {
            gui_destroy()
            SoundSet, 50
        }
else if Pedersen = v55 ; volume set to 55
        {
            gui_destroy()
            SoundSet, 55
        }
else if Pedersen = v60 ; volume set to 60
        {
            gui_destroy()
            SoundSet, 60
        }
else if Pedersen = v75 ; volume set to 75
        {
            gui_destroy()
            SoundSet, 75
        }
else if Pedersen = v80 ; volume set to 80
        {
            gui_destroy()
            SoundSet, 80
        }
else if Pedersen = v90 ; volume set to 90
        {
            gui_destroy()
            SoundSet, 90
        }
else if Pedersen = v100 ; volume set to 100
        {
            gui_destroy()
            SoundSet, 100
        }
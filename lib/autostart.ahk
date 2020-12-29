GetAutoStartupShortcutFilePath(name) {
    return A_StartupCommon . "\" . name . ".lnk"
}



IsAutoStartup(name) {
    linkFile := GetAutoStartupShortcutFilePath("abc")
    MsgBox, %linkFile%
    IfExist, % linkFile
    {
        FileGetShortcut, %linkFile%, lnkTarget
        if (lnkTarget != A_ScriptFullPath)
            return False
    }
    return False
}

a := IsAutoStartup("CapsLock+")
MsgBox, %a%

CreateShortcutForAutoStartup(name) {
    IfExist, % autostartLnk
    {
        FileGetShortcut, %autostartLnk%, lnkTarget
        if(lnkTarget!=A_ScriptFullPath)
            FileCreateShortcut, %A_ScriptFullPath%, %autostartLnk%, %A_WorkingDir%
    }
    else
    {
        FileCreateShortcut, %A_ScriptFullPath%, %autostartLnk%, %A_WorkingDir%
    }
}
# hdiutil-for-MX-Keys

This project is created as memo to remind how to configure MX Keys only remapping of keys unsing no additional SW for macOS and Karabiner Elements is not necesary - I don't like fancy keyloggers. 

Remapping of keys should work after reboot. 

Purpose is remap right CMD with right OPT to align Windows and Mac key bindings for polish characters. You can modify it as you like though :) 

This is extreemly usefull when Logitech Flow is enabled. See https://github.com/pqrs-org/Karabiner-Elements/issues/3107

## Explanation

Very good blog post explaining all the details

https://rakhesh.com/mac/using-hidutil-to-map-macos-keyboard-keys/



## Preconditions

Clone repository

```
git clone https://github.com/sodelalbert/hdiutil-for-MX-Keys.git
```

You need to find product ID of MX Keys from Mac System Report

<img width="879" alt="Zrzut ekranu 2022-11-21 o 19 56 30" src="https://user-images.githubusercontent.com/1679514/203136999-95fcac9c-e8a9-425e-9ca4-31405eb8eb2e.png">

Go to hdiutil-for-MX-Keys and paste Product ID line #14 of local.hidutilKeyMapping.plist

```
"ProductID": 0xB35B
```

Copy local.hidutilKeyMapping.plist file to LaunchAgents directory. If not existant create one

```
vim ~/Library/LaunchAgents/local.hidutilKeyMapping.plist
```

Paste sample file content from this repository and edit ProductID. Save, quit.

Permissions:
-rw-r--r--@ 1 [your_uesername]  staff   994B 25 lis 15:29 local.hidutilKeyMapping.plist



## Setup launchctl

Add service to launchctl and start it 
```
launchctl load ~/Library/LaunchAgents/local.hidutilKeyMapping.plist; launchctl start local.hidutilKeyMapping
```


Reboot proof solution is done.


# Alternative launching option

Launchctl seems to be changing from release to release of MacOS and it stopped working for ventura. 

https://stackoverflow.com/questions/6442364/running-script-upon-login-in-mac-os-x


# Remap of END HOME keys for MX Master


```
cd ~/Library; mkdir KeyBindings; cd KeyBindings; vi DefaultKeyBinding.dict
```

Copy and paste following content
```
$ cd ~/Library
$ mkdir KeyBindings
$ cd KeyBindings
$ vi DefaultKeyBinding.dict

```

Copy and paste following configuration

```
{
/* Remap Home / End keys to be correct */
"\UF729" = "moveToBeginningOfLine:"; /* Home */
"\UF72B" = "moveToEndOfLine:"; /* End */
"$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
"$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
"^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
"^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
"$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
"$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
}
```




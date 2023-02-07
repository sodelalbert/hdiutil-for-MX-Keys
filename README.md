# hdiutil-for-MX-Keys

This project is created as memo to remind how to configure MX Keys only remapping of keys unsing no additional SW for macOS and Karabiner Elements is not necesary - I don't like fancy keyloggers. 

Remapping of keys should work after reboot. 

Purpose is remap right CMD with right OPT to align Windows and Mac key bindings for polish characters. You can modify it as you like though :) 

This is extreemly usefull when Logitech Flow is enabled. See https://github.com/pqrs-org/Karabiner-Elements/issues/3107


## Installation steps



* You need to find product ID of MX Keys from Mac System Report 

    ```
    "ProductID": 0xB35B
    ```
    
    <img width="879" alt="Zrzut ekranu 2022-11-21 o 19 56 30" src="https://user-images.githubusercontent.com/1679514/203136999-95fcac9c-e8a9-425e-9ca4-31405eb8eb2e.png">

In case it's conencted via Logi Unifying receiver you can find coresponding ProductID in USB section.


* Update ProductID in MxKeysBindings.sh file. 


* Copy file MxKeysBindings.sh to your Documents folder adn add executionpermission  - you can use any folder you like. 

    ```
    cp MxKeysBindings.sh ~/Documents/; chmod a+x ~/Documents/MxKeysBindings.sh
    ```


* Install crontab entry ```crontab -e```

    ```
    * * * * * cd /Users/[USER_HOME_DIR]/Documents && ./MxKeysBindings.sh
    ```

# Remap of END HOME keys for MX Master

Copy and paste following content
```
cd ~/Library; mkdir KeyBindings; cd KeyBindings; vi DefaultKeyBinding.dict
```


Paste following configuration

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

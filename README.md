# hdiutil-for-MX-Keys

This project is created as memo to remind how to configure MX Keys only remapping of keys unsing no additional SW for macOS and Karabiner Elements is not necesary - I don't like fancy keyloggers. 

Remapping of keys should work after reboot. 

Purpose is remap right CMD with right OPT to align Windows and Mac key bindings for polish characters. You can modify it as you like though :) 


##Explanation


https://rakhesh.com/mac/using-hidutil-to-map-macos-keyboard-keys/



## Preconditions

Clone repository

```
git clone https://github.com/sodelalbert/hdiutil-for-MX-Keys.git
```
Copy local.hidutilKeyMapping.plist file to LaunchAgents directory. If not existant create one

```
cp local.hidutilKeyMapping.plist ~/Library/LaunchAgents/
```

## Setup launchctl

Add service to launchctl
```
launchctl load ~/Library/LaunchAgents/local.hidutilKeyMapping.plist
```

Start service
```
launchctl start local.hidutilKeyMapping
```

Reboot proof solution is done.


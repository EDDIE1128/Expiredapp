# Expired App
An app can achieve the basic function of expired

## IOS setting
### Turn on developer mode on your phone 
https://developer.apple.com/documentation/xcode/enabling-developer-mode-on-a-device
### Accessing recorded data files 
There are multiple ways to access files:
(1) iTunes > iPhone > Sync Settings > Files
(2) https://support.apple.com/en-us/119585 (phone needs to be USB-connected)
(3) Use Files app on iPhone and share via AirDrop. To enable this, you need to add `Supports opening documents in place` to be `Yes` in the Info.plist.
### Code files to edit:
ViewController.swift
### Additional tips:
(1) Open the *.xcworkspace project not* the *.xcodeproj file
(2) May need to add your account as a trusted developer in iPhone settings
(3) Change the team setting on Xcode to your Apple account
Go to https://developer.apple.com/account in Safari to make sure you accepted all agreements Bundle identifier needs to be globally unique (random string is ok)

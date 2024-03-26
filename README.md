# ZohoDesk-PortalSDK-sample-apps-flutter


Sample code for integrating Zoho Desk Portal SDK into flutter Applications.

## Configuring SDK

you can run this project to preview your help center in a application. 
To do that you need to change the orgId, appId and dataCenter values present in the main.dart file. 

## Setup User Login

In main.dart file,
    For Login - Use the loginTheUserIntoHelpCenter() Method to login your users in Zoho Desk Portal SDK addon. 
In this methods you need to pass valid JwtToken and call this function after initialising Zoho Desk Portal SDK addon.
    For Logout - Use the logoutTheUserFromHelpCenter() Method to logout the user from Zoho Desk Portal SDK addon.

## Customize the Theme colours

Zoho Desk Portal SDK addon provides option to edit the Theme colours for both Light and Dark mode. Todo that you need to configure your themes individually for both ios and android modules.

For Android -> Find the code snippet in MainActivity.kt
For IOS -> Find the code snippet in AppDelegate.swift

## Configuring Push Notification

You can enable the push notification Zoho Desk Portal SDK addon. As of now firebase, we supports fire base push notification android and apple push notification for IOS.

For Android -> Use the setFCMTokenAndEnablePushNotificationForAndroid method in main.dart file to enable the push notification for android.
And use the notificationHandler method in the same file for handling the received push notification
For IOS -> Refer the code snippets in AppDelegate.swift file present in IOS Module.



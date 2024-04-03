import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart' show ZDPDataCenter;
import 'package:zohodesk_portal_apikit/zohodesk_portal_apikit.dart' show ZohodeskPortalApikit;
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration.dart' show ZohodeskPortalConfiguration;
import 'app_home_screen.dart';

Future<void> main() async {

    // setUpPushNotification(); // Setting Up The Push Notification
    runApp(const FlutterDemoApp());
}

Future<void> setUpPushNotification() async {
    await Firebase.initializeApp();

    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {

        FirebaseMessaging.onBackgroundMessage(notificationHandler);

        FirebaseMessaging.instance.onTokenRefresh.listen(setTokenAndEnablePushNotification);
        String? token = await FirebaseMessaging.instance.getToken();

        setTokenAndEnablePushNotification(token);
    }
}

Future<void> notificationHandler(RemoteMessage message) async { // Call this method to handle the push notification
    ZohodeskPortalConfiguration.handleNotification(message.data);
}

Future<void> setTokenAndEnablePushNotification(String? fcmToken) async { // Call this method to enable push notification for android
    if(fcmToken != null){
        ZohodeskPortalApikit.enablePush(fcmToken);
    }
}

class FlutterDemoApp extends StatefulWidget {
    const FlutterDemoApp({super.key});

    @override
    State<FlutterDemoApp> createState() => _App();

}

class _App extends State<FlutterDemoApp>{

    ThemeMode themeMode = ThemeMode.light;

    @override
    dynamic initState(){

        ZohodeskPortalApikit.initializeSDK("orgId", "appId", ZDPDataCenter.US); // Initializes the ASAP SDK
        ZohodeskPortalApikit.enableLogs(); // For Debugging purpose

        super.initState();
    }

    static loginTheUserIntoHelpCenter() async { //use this methods for authenticating users in the asap SDK
        ZohodeskPortalApikit.login(
            "Jwt Token",
            (isSuccess){
                if(isSuccess){
                    //User Authenticated Successfully
                }else{
                    //User Authentication Failed
                }
            }
        );
    }

    static logoutTheUserFromHelpCenter() async { //use this methods for logout the users from asap SDK
        ZohodeskPortalApikit.logout(
            (isSuccess){
                if(isSuccess){
                    //User Logged out Successfully
                }else{
                    //Failed to log out the user
                }
            }
        );
    }

    void changeTheme(){
        setState(() {
            if(themeMode == ThemeMode.light){
                themeMode = ThemeMode.dark;
            }else {
                themeMode = ThemeMode.light;
            }

        });
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'ASAP Flutter Demo App',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            home: AppHomePage(
                title: 'Flutter Demo App',
                themeMode: themeMode,
                onChangeTheme: changeTheme
            ),
        );
    }

}
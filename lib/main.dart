import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:zohodesk_portal_apikit/common/ZDPortalAPIKitConstants.dart' show ZDPDataCenter;
import 'package:zohodesk_portal_apikit/zohodesk_portal_apikit.dart' show ZohodeskPortalApikit;
import 'app_home_screen.dart';

void main() {
  runApp(const FlutterDemoApp());
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
                    log("isSuccess");
                    //User Authenticated Successfully
                }else{
                    log("fail");
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



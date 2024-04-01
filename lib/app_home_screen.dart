import 'package:asap_flutter_demo/models/data.dart';
import 'package:flutter/material.dart';
import 'package:zohodesk_portal_configuration/data/configuration_model.dart' show ZDPTheme;
import 'package:zohodesk_portal_configuration/zohodesk_portal_configuration.dart' show ZohodeskPortalConfiguration;
import 'widgets/moduleItem.dart';

class AppHomePage extends StatefulWidget {
    const AppHomePage({super.key, required this.title, required this.themeMode, required this.onChangeTheme,});

    final String title;
    final ThemeMode themeMode;
    final Function onChangeTheme;

    @override
    State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {

    @override
    void initState() {
        ZohodeskPortalConfiguration.setTheme(ZDPTheme.light);//Sets light as ThemeMode. Default will be System
        super.initState();
    }

    static List<dynamic> getModulesListData(){
        List a = [];

        a.add("All User Modules");
        a.addAll(asapGuestUserModulesList);
        a.add("Authenticated User Modules");
        a.addAll(asapLoggedUserModules);

        return a;
    }

    void changeThemeMode(){
        final ZDPTheme themeMode;
        if (widget.themeMode == ThemeMode.light) {
            themeMode = ZDPTheme.dark;
        } else {
            themeMode = ZDPTheme.light;
        }
        setState(() {
            widget.onChangeTheme();
        });
        ZohodeskPortalConfiguration.setTheme(themeMode); // Sets the theme mode in ASAP SDK
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
                actions: [
                  IconButton(
                      onPressed: changeThemeMode,
                      icon: Icon(widget.themeMode == ThemeMode.light ? Icons.mode_night : Icons.sunny)
                  )
                ],
            ),
            body: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView.builder(
                    itemCount: getModulesListData().length,
                    itemBuilder: (context, index) {
                      final listItem = getModulesListData()[index];
                        if (listItem is String) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(listItem, style: Theme.of(context).textTheme.titleMedium)
                            );
                        } else{
                            return ModulesItem(module: listItem);
                        }
                    }
                ))
        );
    }
}


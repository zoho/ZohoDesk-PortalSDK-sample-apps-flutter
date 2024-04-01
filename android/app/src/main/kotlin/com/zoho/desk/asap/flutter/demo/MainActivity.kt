package com.zoho.desk.asap.flutter.demo

import android.graphics.Color
import android.os.Bundle
import com.zoho.desk.asap.configuration.zohodesk_portal_configuration.ZDPTheme
import com.zoho.desk.asap.configuration.zohodesk_portal_configuration.ZohodeskPortalConfigurationPlugin
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity(){

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        ZohodeskPortalConfigurationPlugin.setNotificationIcon(R.mipmap.ic_launcher)

        ZohodeskPortalConfigurationPlugin.setThemeBuilder(
            ZDPTheme.Builder(false)
                .setColorPrimary(Color.parseColor("#673AB7"))
                .setColorPrimaryDark(Color.parseColor("#673AB7"))
                .setColorAccent(Color.parseColor("#673AB7"))
                .build()
        )
        ZohodeskPortalConfigurationPlugin.setThemeBuilder(
            ZDPTheme.Builder(true)
                .setColorPrimary(Color.parseColor("#7E57C2"))
                .setColorPrimaryDark(Color.parseColor("#7E57C2"))
                .setColorAccent(Color.parseColor("#7E57C2"))
                .build()
        )
    }

}

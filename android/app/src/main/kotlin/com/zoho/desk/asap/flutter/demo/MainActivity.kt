package com.zoho.desk.asap.flutter.demo

import android.graphics.Color
import com.zoho.desk.asap.common.ZDPortalConfiguration
import com.zoho.desk.asap.common.utils.ZDPTheme
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity(){


    override fun onPause() {
        super.onPause()
        ZDPortalConfiguration.setThemeBuilder(
            ZDPTheme.Builder(false)
                .setColorPrimary(Color.parseColor("#673AB7"))
                .setColorPrimaryDark(Color.parseColor("#673AB7"))
                .setColorAccent(Color.parseColor("#673AB7"))
                .build()
        )
        ZDPortalConfiguration.setThemeBuilder(
            ZDPTheme.Builder(true)
                .setColorPrimary(Color.parseColor("#7E57C2"))
                .setColorPrimaryDark(Color.parseColor("#7E57C2"))
                .setColorAccent(Color.parseColor("#7E57C2"))
                .build()
        )
    }

}

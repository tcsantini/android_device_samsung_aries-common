package com.cyanogenmod.settings.device;

import android.content.BroadcastReceiver;
import android.content.SharedPreferences;
import android.content.Context;
import android.content.Intent;
import android.preference.PreferenceManager;

public class Startup extends BroadcastReceiver {

    @Override
    public void onReceive(final Context context, final Intent bootintent) {
        Apply.restore(context);
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        int apply = sharedPrefs.getBoolean(DeviceSettings.KEY_APPLY, true) ? 1 : 0;
	if(apply == 1) {
        ColorTuningPreference.restore(context);
        Mdnie.restore(context);
        TouchKeyBacklightTimeout.restore(context);
        Hspa.restore(context);
        VolumeBoostPreference.restore(context);
        DockAudio.restore(context);
        Sanity.check(context);
        VibrationPreference.restore(context);
	}
    }

}

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class Apply implements OnPreferenceChangeListener {


    /**
     * Restore dockaudio settings from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        int value = sharedPrefs.getBoolean(DeviceSettings.KEY_APPLY, true) ? 1 : 0;
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
	if(((CheckBoxPreference)preference).isChecked()) {
	DeviceSettings.setPreferenceBoolean(DeviceSettings.KEY_APPLY, true);
	} else {
	DeviceSettings.setPreferenceBoolean(DeviceSettings.KEY_APPLY, false);
	}
        return true;
    }

}

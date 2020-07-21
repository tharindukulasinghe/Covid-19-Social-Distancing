import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SettingsList(
      sections: [
        SettingsSection(
          title: 'User Preferences',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onTap: () {},
            ),
            SettingsTile.switchTile(
              title: 'Use location data for analysis',
              leading: Icon(Icons.location_city),
              switchValue: value,
              onToggle: (bool value) {},
            ),
            SettingsTile(
              title: 'Duration',
              subtitle: '30 days',
              leading: Icon(Icons.language),
              onTap: () {},
            ),
          ],
        ),
      ],
    ));
  }
}

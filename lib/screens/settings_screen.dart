import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/main.dart'; // for themeNotifier

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: kBlueLightColor,
        leading: const BackButton(color: Colors.black),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeNotifier.value == ThemeMode.dark,
            onChanged: (val) {
              themeNotifier.value =
                  val ? ThemeMode.dark : ThemeMode.light;
            },
            secondary: Icon(Icons.dark_mode, color: isDarkMode ? Colors.white : Colors.black),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AccountScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PrivacyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HelpScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ================= Account Screen =================
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: kBlueLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Manage your account details here.\n\n"
          "• Update your profile\n"
          "• Change preferences\n"
          "• View app usage",
          style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

// ================= Notifications Screen =================
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool meditationReminders = true;
  bool dailyTips = true;
  bool updates = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: kBlueLightColor,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Meditation Reminders"),
            value: meditationReminders,
            onChanged: (val) {
              setState(() => meditationReminders = val);
            },
          ),
          SwitchListTile(
            title: const Text("Daily Tips"),
            value: dailyTips,
            onChanged: (val) {
              setState(() => dailyTips = val);
            },
          ),
          SwitchListTile(
            title: const Text("Updates & Promotions"),
            value: updates,
            onChanged: (val) {
              setState(() => updates = val);
            },
          ),
        ],
      ),
    );
  }
}

// ================= Privacy Screen =================
class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool locationAccess = false;
  bool analyticsSharing = true;
  bool personalizedAds = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy"),
        backgroundColor: kBlueLightColor,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Location Access"),
            value: locationAccess,
            onChanged: (val) {
              setState(() => locationAccess = val);
            },
          ),
          SwitchListTile(
            title: const Text("Analytics Sharing"),
            value: analyticsSharing,
            onChanged: (val) {
              setState(() => analyticsSharing = val);
            },
          ),
          SwitchListTile(
            title: const Text("Personalized Ads"),
            value: personalizedAds,
            onChanged: (val) {
              setState(() => personalizedAds = val);
            },
          ),
        ],
      ),
    );
  }
}

// ================= Help Screen =================
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Help"),
        backgroundColor: kBlueLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Need help? Find answers here:\n\n"
          "• FAQs\n"
          "• Contact support,\n"
          "     email - harjitsinh.raol701@gmail.com",
          style: TextStyle(fontSize: 16, color: isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

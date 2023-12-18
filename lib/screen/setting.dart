import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kashbook_app/provider/theme_provider.dart';

import 'setting_tile.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Setting',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Switch(
                        value: ref.watch(isDarkThemeProvider),
                        onChanged: (bool value) {
                          ref
                              .read(isDarkThemeProvider.notifier)
                              .update((state) => !state);
                        },
                      ),
                    ]),
                const SizedBox(height: 30),
                const Text(
                  'My Account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SettingTile(
                  preffixIcon: Icons.person_2_outlined,
                  title: 'Profile',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                SettingTile(
                  preffixIcon: Icons.person_add_outlined,
                  title: 'Edit Profile',
                  onTap: () {},
                ),
                
                const Divider(
                  height: 20,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Security',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SettingTile(
                  preffixIcon: Icons.lock_reset_outlined,
                  title: 'Password',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                SettingTile(
                  preffixIcon: Icons.policy_outlined,
                  title: 'Privacy policy',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                SettingTile(
                  preffixIcon: Icons.preview,
                  title: 'View Users',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Support & About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                SettingTile(
                  preffixIcon: Icons.chat_bubble_outline_outlined,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                SettingTile(
                  preffixIcon: Icons.info_outline_rounded,
                  title: 'Report an issue',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                ),
                SettingTile(
                  preffixIcon: Icons.favorite_outline,
                  title: 'Rate App',
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                )
              ])
            ])));
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:yourhome_web/utils/components/menubar.dart';
import 'package:yourhome_web/utils/components/account_container.dart';
import 'package:yourhome_web/utils/widget/screen_widgets/devices_widget.dart';
import 'package:yourhome_web/utils/widget/screen_widgets/history_widget.dart';
import 'package:yourhome_web/utils/widget/screen_widgets/account_widget.dart';
import 'package:yourhome_web/utils/widget/screen_widgets/dashboard_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    'Dash Board',
    'Devices Manager',
    'History',
    'Account Settings',
  ];
  final List<Widget> _screens = [
    const DashboardWidget(),
    const DevicesWidget(),
    const HistoryWidget(),
    const AccountWidget(),
  ];
  final List<IconData> _icons = [
    Icons.dashboard,
    Icons.devices,
    Icons.history,
    Icons.account_circle,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Color(0x96FF7337),
            child: Column(
              children: [
                AccountContainer(
                  name: 'John Doe',
                  phone: '+1234567890',
                  deviceId: '1234567890',
                  avatarUrl: 'https://cdn2.tuoitre.vn/thumb_w/1200/2019/5/8/avatar-publicitystill-h2019-1557284559744252594756.jpg',
                ),
                Expanded(
                  child: CustomMenuBar(
                    selectedIndex: _selectedIndex,
                    icons: _icons,
                    categories: _categories,
                    onItemTapped: _onItemTapped,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage('assets/images/logos/logo-white.png'),
                        width: MediaQuery.of(context).size.width * 0.13,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
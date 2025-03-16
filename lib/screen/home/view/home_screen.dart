import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

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
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  final List<String> _categories = ['Dashboard', 'Devices Management', 'History & Logs', 'Account Settings'];
  final List<Widget> _screens = [
    DevicesWidget(),
    HistoryWidget(),
    AccountWidget(),
    DashboardWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_calculateSelectedIndex);
  }

  void _calculateSelectedIndex() {
    final double maxScrollExtent = _scrollController.position.maxScrollExtent;
    final double currentScroll = _scrollController.position.pixels;
    final double scrollPercent = currentScroll / maxScrollExtent;
    final int selectedIndex = (scrollPercent * _categories.length).floor();
    if (selectedIndex != _selectedIndex) {
      setState(() {
        _selectedIndex = selectedIndex;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _scrollController.animateTo(
        index * MediaQuery.of(context).size.width,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categories[_selectedIndex].tr()),
      ),
      body: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _categories.map((category) {
          return BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: category.tr(),
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

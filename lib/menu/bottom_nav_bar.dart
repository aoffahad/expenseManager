import 'package:expense_manager/menu/dashboard.dart';
import 'package:expense_manager/menu/expense_add_delete.dart';
import 'package:expense_manager/menu/report_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Dashboard(),
    ExpenseAddDelete(),
    ExpenseReport(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color(0XFF2A6794),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: GNav(
            backgroundColor: const Color(0XFF2A6794),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff5193BB),
            padding: EdgeInsets.all(16),
            gap: 8,
            onTabChange: _navigateBottomBar,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Dashboard',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Expense Settings',
              ),
              GButton(
                icon: Icons.search,
                text: 'Expense Report',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

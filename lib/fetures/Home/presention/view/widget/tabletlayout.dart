import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:open/fetures/Home/presention/view/widget/bodyhome.dart';
import 'package:open/fetures/Home/presention/view/widget/customdrwer.dart';

class tablet extends StatefulWidget {
  const tablet({super.key});

  @override
  State<tablet> createState() => _tabletState();
}

class _tabletState extends State<tablet> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const bodytablet(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.blue,
              hoverColor: Colors.blue,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue.withOpacity(.9),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.countertops,
                  text: 'courses',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'calender',
                ),
                GButton(
                  icon: Icons.account_tree_sharp,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bodytablet extends StatelessWidget {
  const bodytablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 1, child: CustomDrawer()),
        Expanded(flex: 3, child: BodyHome()),
      ],
    );
  }
}

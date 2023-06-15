import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../Widgets/bottomMyshop.dart';
import '../Widgets/bottomhome.dart';
import '../Widgets/bottomprofile.dart';
import 'create_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cureentindex = 0;
 final tabs = [ BottomHome(), Createshop(), BottomProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_cureentindex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GNav(
              padding: EdgeInsets.all(12),
              gap: 8,
              tabBackgroundColor: Colors.green.shade50,
              tabs: [
                GButton(icon: Icons.home,
                  text: 'Home',),
                GButton(icon: Icons.shop,
                  text: 'shop',),
                GButton(icon: Icons.person,
                  text: 'user',),
              ],
              selectedIndex: _cureentindex,
              onTabChange: (setvalue) {
                setState(() {
                  _cureentindex =setvalue;
                }
    );
              },
            ),
          ),
        ),
      ),

    );
  }
}

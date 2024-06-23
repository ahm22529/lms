import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:open/fetures/Courses/data/repo/Repo.dart';
import 'package:open/fetures/Courses/data/repo/RepoImp.dart';
import 'package:open/fetures/Courses/presention/manager/cubit/enroil_cubit_cubit.dart';
import 'package:open/fetures/Courses/presention/view/Courses.dart';
import 'package:open/fetures/Home/presention/view/widget/bodyhome.dart';
import 'package:open/fetures/account/prseintion/view/Account.dart';
import 'package:open/fetures/calender/Presintion/view/calender.dart';
import 'package:open/fetures/cha/main.dart';
import 'package:open/fetures/cha/screens/chat_screen.dart';
class Mobile extends StatefulWidget {
  const Mobile({Key? key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  int _selectedIndex = 0;
  EnroliRepo enroliRepo = EnroliRepoImp();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EnroilCubitCubit(enroliRepo: enroliRepo),
      child: Scaffold(
        
        body: IndexedStack(
          index: _selectedIndex,
          children: [BodyHome(), EnroilCourses(), CalenderPage(), Account()],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('chat gpt'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>mmll()));
                },
              ),
            
            ],
          ),
        ),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: const Color.fromARGB(255, 9, 9, 9),
                hoverColor: Colors.blue,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
      ),
    );
  }
}

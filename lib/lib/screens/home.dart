import 'package:flutter/material.dart';
import 'package:flutter_cir2w16/lib/screens/stream_screen.dart';

import 'contact.dart';
import 'first_screen.dart';
import 'future_screen.dart';
import 'login.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/home';

  const HomeScreen({Key? key}) : super(key: key); //1.create Constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState(); //2.create state
}

class _HomeScreenState extends State<HomeScreen> {
  int index_ = 0;

  List pages = [
    // HomeScreen(),
    const FirstScreen(),// index_ = 0
    const ProfileScreen(),// index_ = 1
    const ContactScreen(),// index_ = 2
    const LoginScreen(),// index_ = 3
    const FutureScreen(),//index_ = 4
    StreamScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Flutter App"),
      //   centerTitle: true,
      //   backgroundColor: Colors.indigo,
      // ),
      body: pages[index_],
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              child: UserAccountsDrawerHeader(
                accountName: Text("Mark Zakerberg"),
                accountEmail: Text("mark@gmail.com"),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg"),
                ),
              ),
            ),
            ListTile(
              title: const Text("Home",
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
              leading: const Icon(
                Icons.home,
                color: Colors.indigo,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text("Profile",
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
              leading: const Icon(
                Icons.manage_accounts,
                color: Colors.indigo,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text("Contact",
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
              leading: const Icon(
                Icons.contact_page,
                color: Colors.indigo,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactScreen()));
              },
            ),
            ListTile(
              title: const Text("First",
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
              leading: const Icon(
                Icons.call,
                color: Colors.indigo,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()));
              },
            ),
            ListTile(
              title: const Text("First",
                  style: TextStyle(color: Colors.indigo, fontSize: 15)),
              leading: const Icon(
                Icons.call,
                color: Colors.indigo,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FutureScreen()));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index_,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts),
              label: "Profile",
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: "Contact",
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: "Login",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.stream),
              label: "Stream",
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: "Future",
              backgroundColor: Colors.yellow),
        ],
        onTap: (index) {
          setState(() {
            index_ = index;
          });
          print(index);
        },
        
      ),
    );
  }
}
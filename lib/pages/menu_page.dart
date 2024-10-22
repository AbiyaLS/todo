import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF604CC3),Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
        ),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Row(
                  children: [
                    // Profile image
                    Padding(
                      padding: const EdgeInsets.all(16.0), // Add padding
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/pic1.png"),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Abiya",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            ListTile(
              leading: Icon(Icons.home,color: Colors.white),
              title: Text('Home',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person,color: Colors.white),
              title: Text('Profile',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.white),
              title: Text('Settings',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info,color: Colors.white,),
              title: Text('Details',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

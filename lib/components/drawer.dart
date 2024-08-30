import 'package:flutter/material.dart';
import 'package:instagramclone/screens/explore.dart';
import 'package:instagramclone/screens/instagramhome/Instahome.dart';
import 'package:instagramclone/screens/profile.dart';

ListView customdrawer(BuildContext context) {
    
  return ListView(
    children: <Widget>[
    const  DrawerHeader(
  
      child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
    
         CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/Capture.PNG'),
            ),
      Text('Bean bliss'),    
          
      ],
    )),
      ListTile(
        title: const Text('Home'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Instahome()));
        },
      ),
      ListTile(
        title: const Text('Profile'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  Profile()));
        },
      ),
      ListTile(
        title: const Text('Explore'),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const explore()));
        },
      ),
    ],
  );
}

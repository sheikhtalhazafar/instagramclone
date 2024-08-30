import 'package:flutter/material.dart';
import 'package:instagramclone/models/status.dart';
import 'package:instagramclone/screens/stroyscreen.dart';

Material statusSection(BuildContext context) {
  final List<Status> statusimages = [
    Status(imagpath: 'images/Capture.PNG', uploadername: 'Bean Bliss'),
    Status(imagpath: 'images/status1.PNG', uploadername: 'Aldenaire'),
    Status(imagpath: 'images/status2.PNG', uploadername: 'Barry''s'),
    Status(imagpath: 'images/status3.PNG', uploadername: 'steve.io'),
    Status(imagpath: 'images/status1.PNG', uploadername: 'samentha'),
    Status(imagpath: 'images/status2.PNG', uploadername: 'jessica'),
  ];

  return Material(
    elevation: 1,
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      height: 120,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                   GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const StoryScreen()));
                    },
                     child:const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('images/profilepicture.PNG'),
                                       ),
                   ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      radius: 10,
                      child: const Icon(Icons.add, size: 20),
                    ),
                  ),
                ],
              ),
              const Text(
                'Ruffles',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: statusimages.map((value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        padding: const EdgeInsets.all(
                            3), // Adjust the padding to control border thickness
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue,
                              Colors.purple
                            ],
                            stops: [0.1, 0.3, 0.5, 0.7, 0.9, 1.0],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(value.imagpath),
                        ),
                      ),
                    ),
                    Text(value.uploadername)
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    ),
  );
}

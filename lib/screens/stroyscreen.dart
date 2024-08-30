import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/storyimg.png'),
                      fit: BoxFit.cover)),
            ),


          const  Positioned(
                            top: 20,
              left: 16, // Add padding from the left
              right: 16, 
              child: Divider()),


             Positioned(
              top: 30,
              left: 16, // Add padding from the left
              right: 16, // Add padding from the right
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the top
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Capture.PNG'),
                  ),
                const   SizedBox(
                      width:
                          8), // Add some space between the avatar and the column
                 const Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align text to the start (left)
                    children:  [
                      Row(
                        children: [
                          Text('Bean Bliss',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          SizedBox(width: 4), // Space between text and icon
                          Icon(Icons.star_border_purple500_rounded,
                              color: Colors.white),
                        ],
                      ),
                      Text('Sponsored',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ],
                  ),
                  const Spacer(), // Pushes the rest of the content to the end
                  const Text('...', style: TextStyle(fontSize: 28, color: Colors.white)),
                  const SizedBox(width: 8), // Add space between text and icon
                   GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel_outlined, color: Colors.white, size: 30,)),
                ],
              ),
            )
          ]),
        ),
        Container(
          height: 70, // Adjust height as needed
          width: MediaQuery.of(context).size.width, // Full width of the screen
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45, // Adjust height as needed
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                      color: Colors.transparent, // Fully transparent background
                      border: Border.all(
                        color: Colors.white, // White border
                        width: 1.0, // Border thickness
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 8, left: 15),
                      child: Text(
                        'send message',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Icon(Icons.favorite_outline_outlined, color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

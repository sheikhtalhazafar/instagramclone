import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagramclone/components/appbar.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:instagramclone/components/drawer.dart';
import 'package:instagramclone/models/profilemodel.dart';

// ignore: camel_case_types, must_be_immutable
class Profile extends StatelessWidget {
   Profile({super.key});

List<Profiemodel> pictures =[
  Profiemodel(profilebodyimg: 'images/profilebody1.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody2.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody3.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody4.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody5.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody6.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody7.PNG'),
  Profiemodel(profilebodyimg: 'images/profilebody8.PNG'),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'EatOut-RoofTop',
        icon: Icons.notifications_none_outlined,
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomRight,
          child: customdrawer(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(3),
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
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xffFFFFFF),
                      child: CircleAvatar(
                        radius: 43,
                        backgroundImage: AssetImage('images/profilepicture.PNG'),
                      ),
                    ),
                  ),
                ),
                // Stats and Social Media Icons
             const   Expanded(
                  child: Column(
                    children: [
                      // Stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          StatsWidget(count: '134', label: 'posts'),
                          StatsWidget(count: '5,678', label: 'followers'),
                          StatsWidget(count: '4.5', label: 'Rating'),
                        ],
                      ),
                      // Social Media Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomIcon(iconImg: 'images/instagram.png'),
                          CustomIcon(iconImg: 'images/facebook.png'),
                          CustomIcon(iconImg: 'images/twitter.png'),
                          CustomIcon(iconImg: 'images/youtube.png'),
                          CustomIcon(iconImg: 'images/tik-tok.png'),
                          CustomIcon(iconImg: 'images/linkedin.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),


         const    Column(
              children: [
                Row(
                  children: [
                     SizedBox(width: 10,),
                    Icon(Icons.check, color: Colors.green,),
                    Text('Dine in', style: TextStyle(fontSize: 16,),),
                    SizedBox(width: 10,),

                      Icon(Icons.check, color: Colors.green,),
                    Text('Take out',style: TextStyle(fontSize: 16),),
                    SizedBox(width: 10,),

                      Icon(Icons.check, color: Colors.green,),
                    Text('Delivery',style: TextStyle(fontSize: 16),),
                    SizedBox(width: 10,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image(image: AssetImage('images/world-wide-web.png'))),
                        SizedBox(width: 10,),
                      Text('www.eatouttoprooftop.com'),
                    ],
                  ),
                ),

                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                                            children: [
                                              SizedBox(width: 8,),
                                          Icon(Icons.pin_drop_outlined),
                                                SizedBox(width: 10,),
                                              Text('1441 UpperJames st, Hamillton ON L9B1k2'),
                                            ],
                                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                                            children: [
                                              SizedBox(width: 10,),
                                         Icon(Icons.phone),
                                                SizedBox(width: 10,),
                          
                                              Text('905 555 5126'),
                                            ],
                                          ),
                        ),

                 Padding(
                   padding: EdgeInsets.all(5.0),
                   child: Row(
                    children: [
                      SizedBox(width: 12,),
                                 SizedBox(
                        width: 20,
                        height: 20,
                        child: Image(image: AssetImage('images/clock.png'))),
                        SizedBox(width: 10,),
                   
                      Text('open now -11:00 am - 10:00 pm'),
                    ],
                                   ),
                 )
              ],
            ),
            customtab(),

            Expanded(
              child: GridView.builder(
                itemCount: pictures.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2
                  ),
                 itemBuilder: (context, index){
                  return Container(
                    width: 200,
                    height: 200,
                    child: Image(image: AssetImage(pictures[index].profilebodyimg), fit: BoxFit.fill,),
                  );
                 }),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

// ignore: camel_case_types
class customtab extends StatelessWidget{
  const customtab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TabBar(tabs: [
            SizedBox(
              width: 30,
              height: 30,
        child: Image.asset(
          'images/grid.png',
          fit: BoxFit.contain,  
        ),
      ),

       SizedBox(
              width: 30,
              height: 30,
        child: Image.asset(
          'images/open-magazine.png',
          fit: BoxFit.contain,  
        ),
      ),

       SizedBox(
              width: 30,
              height: 30,
        child: Image.asset(
          'images/hashtag.png',
          fit: BoxFit.contain,  
          color: Colors.grey,
        ),

      ),

      const Icon(Icons.person_pin_outlined, size: 40,  color: Colors.grey,)
          ]),
  
        ],
      ),
    );
  }

}

// Stats Widget for cleaner code
class StatsWidget extends StatelessWidget {
  final String count;
  final String label;

  const StatsWidget({Key? key, required this.count, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      ),
    );
  }
}

// CustomIcon Class for Social Media Icons
class CustomIcon extends StatelessWidget {
  final String iconImg;

  const CustomIcon({Key? key, required this.iconImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.06,  // Adjust size based on screen width
        height: MediaQuery.of(context).size.width * 0.06,  // Adjust size based on screen width
        child: Image.asset(
          iconImg,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

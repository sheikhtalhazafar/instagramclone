import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/components/appbar.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:instagramclone/components/drawer.dart';
import 'package:instagramclone/riverpod/imageslider.dart';
import 'package:instagramclone/screens/instagramhome/instabody.dart';
import 'package:ionicons/ionicons.dart';

class detailscreen extends ConsumerStatefulWidget {
  String heading;
  String profielimg;
  String bodyimage;
  String postname;
  String description;
  List<String> images;
  int currentindex;
  detailscreen(
      {super.key,
      required this.heading,
      required this.profielimg,
      required this.bodyimage,
      required this.postname,
      required this.description,
      required this.images,
      required this.currentindex});

  @override
  ConsumerState<detailscreen> createState() => _detailscreenState();
}

class _detailscreenState extends ConsumerState<detailscreen> {
  @override
  void initState() {
    ref.read(sliderindex.notifier).state = widget.currentindex;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(sliderindex);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'EVE',
        icon: Icons.notifications_none_outlined,
      ),
      drawer: Drawer(
        child: Align(
          alignment: Alignment.bottomRight,
          child: customdrawer(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, child) {
                // final currentIndex = ref.watch(sliderindex);
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(widget.profielimg),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.heading,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border_outlined,
                            size: 30,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 280,
                          decoration: BoxDecoration(
                            // image:  DecorationImage(image: AssetImage(instabody[index].bodyimage), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: PageView.builder(
                              controller:
                                  PageController(initialPage: currentIndex),
                              onPageChanged: (index) {
                                ref.read(sliderindex.notifier).state = index;
                              },
                              itemCount: widget.images.length - 5,
                              itemBuilder: (context, index) {
                                return Image.asset(widget.images[index],
                                    fit: BoxFit.fill);
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.favorite_outline),
                                Icon(Icons.comment_outlined),
                                Icon(Icons.send),
                              ],
                            ),
                            Row(
                              children: List.generate(widget.images.length - 5,
                                  (index) {
                                return CustomAvatar(
                                  radius: index == currentIndex ? 5 : 4,
                                  backgroundColor: index == currentIndex
                                      ? Colors.blue
                                      : Colors.grey,
                                );
                              }),
                            ),
                            const Row(
                              children: [
                                Text(
                                  '8.4 KM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                Icon(Icons.location_on_outlined)
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.postname,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                );
              }),

              // static screen
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Divider(),
              ),

              customRow(
                  icon: Icons.pin_drop_outlined,
                  text1: '123 Main Street',
                  text2: 'Postal Code, City, Country'),
              customRow(
                  icon: Icons.calendar_today,
                  text1: 'friday July 10th - Sunday july 12',
                  text2: '5:00 pm - 12:00 pm'),
              customRow(
                  icon: Ionicons.ticket_outline,
                  text1: 'General Entry - \$10.00',
                  text2: 'kids-free'),

              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Divider(),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text('Events Tags'),
              ),

              Row(
                children: [
                  Expanded(
                      child: customcontainer(containertext: 'Fine Dining')),
                  Expanded(
                      child: customcontainer(containertext: 'Vegetarians')),
                  Expanded(child: customcontainer(containertext: 'Cocktails')),
                  Expanded(
                      child: customcontainer(containertext: 'Vegetarians')),
                ],
              ),

              Row(
                children: [
                  Expanded(
                      child: customcontainer(containertext: 'RoofTop Patio')),
                  Expanded(
                      child: customcontainer(containertext: 'city Skyline')),
                  Expanded(child: customcontainer(containertext: 'Seafood')),
                  Expanded(child: customcontainer(containertext: 'Vegan')),
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

// ignore: camel_case_types
class customcontainer extends StatelessWidget {
  final String containertext;
  customcontainer({required this.containertext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Center(child: FittedBox(child: Text(containertext))),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class customRow extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;
  customRow({required this.icon, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1),
              Text(text2),
            ],
          )
        ],
      ),
    );
  }
}

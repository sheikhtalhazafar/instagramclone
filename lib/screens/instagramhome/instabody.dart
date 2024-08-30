import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagramclone/models/homebody.dart';
import 'package:instagramclone/riverpod/imageslider.dart';
import 'package:instagramclone/screens/instagramhome/descriptionscreen.dart';

Expanded bodysection() {
  List<body> instabody = [
    body(
        heading: 'Roof-topfine-dinning-weekely',
        profielimg: 'images/status1.PNG',
        bodyimage: 'images/global1.PNG',
        postname: 'Season Opening Dinner',
        description:
            'Elevate your evenings at our Rooftop Bar, where stunning city views meet expertly crafted cocktails. Unwind above the hustle and bustle, enjoying a chic atmosphere under the stars.'),
    body(
        heading: 'EatOut-Rooftop Patio & Bar',
        profielimg: 'images/status2.PNG',
        bodyimage: 'images/global2.PNG',
        postname: 'Anniversary party',
        description:
            'Join us every weekend for our Rooftop Brunch, where delicious dishes and bottomless mimosas are served with a side of breathtaking views. Elevate your Sunday routine in style, high above the city.'),
    body(
        heading: 'jungle kitchen and Bar',
        profielimg: 'images/status3.PNG',
        bodyimage: 'images/global3.PNG',
        postname: 'Family Night',
        description:
            'Escape to our Rainforest Kitchen and Bar, where lush greenery and exotic flavors create a dining experience like no other. Immerse yourself in a tropical oasis while savoring fresh, vibrant dishes and handcrafted cocktails.'),
    body(
        heading: 'Roof-topfine-dinning-weekely',
        profielimg: 'images/Capture.PNG',
        bodyimage: 'images/global14.PNG',
        postname: 'Season Opening Dinner',
        description:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
    body(
        heading: 'Roof-topfine-dinning-weekely',
        profielimg: 'images/insta1.jpg',
        bodyimage: 'images/insta4.webp',
        postname: 'Anniversary party',
        description:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
    body(
        heading: 'jungle kitchen and Bar',
        profielimg: 'images/insta2.jpg',
        bodyimage: 'images/insta1.jpg',
        postname: 'Family Night',
        description:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
    body(
        heading: 'EatOut-Rooftop Patio & Bar',
        profielimg: 'images/insta3.jpg',
        bodyimage: 'images/insta2.jpg',
        postname: 'Season Opening Dinner',
        description:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
    body(
        heading: 'Roof-topfine-dinning-weekely',
        profielimg: 'images/insta1.jpg',
        bodyimage: 'images/insta4.webp',
        postname: 'Anniversary party',
        description:
            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.'),
  ];
  
  return Expanded(
    child: ListView.builder(
        itemCount: instabody.length,
        itemBuilder: (context, index) {
          return Consumer(builder: (context, ref, child) {
            final currentIndex = ref.watch(sliderindex);
            final PageController pageController = PageController(
  initialPage: ref.read(sliderindex), // Start from the last viewed index
);
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(instabody[index].profielimg),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        instabody[index].heading,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    decoration: BoxDecoration(
                      // image:  DecorationImage(image: AssetImage(instabody[index].bodyimage), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detailscreen(
                                        heading: instabody[index].heading,
                                        profielimg: instabody[index].profielimg,
                                        bodyimage: instabody[index].bodyimage,
                                        postname: instabody[index].postname,
                                        description: instabody[index].description,
                                        images: instabody
                                            .map((e) => e.bodyimage)
                                            .toList(),
                                        currentindex: ref.read(sliderindex),
                                      )));
                        },
                        child: PageView.builder(
                          controller: pageController,
                            onPageChanged: (index) {
                              ref.read(sliderindex.notifier).state = index;
                            },
                            itemCount: instabody.length - 5,
                            itemBuilder: (context, index) {
                              return Image.asset(instabody[index].bodyimage,
                                  fit: BoxFit.fill);
                            }),
                      ),
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
                          children:
                              List.generate(instabody.length - 5, (index) {
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
                                  fontWeight: FontWeight.bold, fontSize: 11),
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
                        instabody[index].postname,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      instabody[index].description,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            );
          });
        }),
  );
}

class CustomAvatar extends StatelessWidget {
  final double radius;
  final Color backgroundColor;

  CustomAvatar({
    required this.radius,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

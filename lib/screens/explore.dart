import 'package:flutter/material.dart';
import 'package:instagramclone/components/bottomnavbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagramclone/components/drawer.dart';


class explore extends StatefulWidget {
  const explore({super.key});

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng mycurrentlocation = const LatLng(30.3753, 69.3451);
  LatLng cheezious = const LatLng(31.5503, 74.2838);
  LatLng cheezious1 = const LatLng(33.7194, 73.0554);
  LatLng cheezious2 = const LatLng(24.860966, 66.990501);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child:  customdrawer(context)
      ),
      body: Container(
        margin: const EdgeInsets.all(0.0),
        child: Stack(
  children: [
    GoogleMap(
      initialCameraPosition: CameraPosition(
        target: mycurrentlocation, 
        zoom: 5
      ),

      markers: {
        Marker(markerId: MarkerId('mycurrentlocation'), icon: BitmapDescriptor.defaultMarker, position: mycurrentlocation),
         Marker(markerId: MarkerId('cheezious'), icon: BitmapDescriptor.defaultMarker, position: cheezious),
         Marker(markerId: MarkerId('cheeziousislamabad'), icon: BitmapDescriptor.defaultMarker, position: cheezious1),
         Marker(markerId: MarkerId('cheeziousiskarachi'), icon: BitmapDescriptor.defaultMarker, position: cheezious2)
      },
    ),
    Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust for padding from screen edges
        height: 50, // Adjust height as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
               IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer(); // Open the drawer
                      },
                    ),
          const  Text('Hinted searcg Text'),
          const  Icon(Icons.search)
          ],
        ),
      ),
    ),

    Positioned(
          top: 120,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Row(
          children: [
            // SizedBox(width: 10,),
            Expanded(child: customcontainermap(containertextmap: 'Price')  ),
            Expanded(child: customcontainermap(containertextmap: 'Rating')  ),
            Expanded(child: customcontainermap(containertextmap: 'Hours')  ),
            Expanded(child: customcontainermap(containertextmap: 'All filters')  ),
          ],
        ),
      ),
    )
  ],
)
      ),
      bottomNavigationBar: bottomnavbar(),
    );
  }
}

// ignore: camel_case_types
class customcontainermap extends StatelessWidget {
  final String containertextmap;
  customcontainermap({required this.containertextmap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
             color: const Color(0xffFFFFFF),
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Center(child: FittedBox(child: Row(children :[ Text(containertextmap), const Icon(Icons.arrow_drop_down_outlined)]))),
        ),
      ),
    );
  }
}
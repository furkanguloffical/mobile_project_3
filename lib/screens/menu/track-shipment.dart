import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class tranckShipmentScreen extends StatefulWidget {
  const tranckShipmentScreen({super.key});

  @override
  State<tranckShipmentScreen> createState() => _tranckShipmentScreenState();
}

class _tranckShipmentScreenState extends State<tranckShipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          "https://i.pinimg.com/originals/c3/c4/09/c3c40926dca06a97dd0562753d63b7f4.png",
          height: 80,
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 80,
          ),
          child: Column(
            children: [
              Container(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Menu",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () => GoRouter.of(context).pop(),
                              icon: const Icon(CupertinoIcons.chevron_back),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkwellMenu(context, "Home", '/home', Icon(Icons.home)),
              InkwellMenu(context, "Track Shipment ", '/trackShipment',
                  Icon(Icons.search)),
              InkwellMenu(context, "Create Shipment ", '/createShipment',
                  Icon(Icons.add_box)),
              InkwellMenu(
                  context, "My Shipments ", '/myShipment', Icon(Icons.inbox)),
              InkwellMenu(context, "Rates and Services  ", '/ratesAndServices',
                  Icon(Icons.monetization_on)),
              InkwellMenu(
                  context, "Support", '/support', Icon(Icons.support_agent)),
              InkwellMenu(context, "Find a Location ", '/findALocation',
                  Icon(Icons.location_on)),
              InkwellMenu(context, "Profile", '/profile', Icon(Icons.person)),
              InkwellMenu(context, "Notifications", '/notifications',
                  Icon(Icons.notifications)),
              InkwellMenu(
                  context, "Settings", '/settings', Icon(Icons.settings)),
              InkwellMenu(context, "Contact ", '/contact', Icon(Icons.call)),
              InkwellMenu(context, "About Us", '/about', Icon(Icons.person)),
              InkwellMenu(context, "Logout", '/', Icon(Icons.logout)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrackingSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class TrackingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Track Your Shipment',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your tracking number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => GoRouter.of(context).go("/trackShipment"),
            child: Text('Track'),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Email: info@globalreachlogistics.com',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            'Phone: +90 (212) 123-4567',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.facebook, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.mail, color: Colors.white),
                onPressed: () {
                  // Navigate to Facebook page
                },
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.phone, color: Colors.white),
                onPressed: () {
                  // Navigate to Facebook page
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

InkWell InkwellMenu(
    BuildContext context, String name, String route, Icon icon) {
  return InkWell(
    onTap: () {
      Navigator.pop(context); // Close the drawer
      GoRouter.of(context).go(route);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          SizedBox(width: 10),
          Text(name),
        ],
      ),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_project_3/core/localizations.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
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
              SafeArea(
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(width: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
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
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu1"),
                  '/home',
                  const Icon(Icons.home)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu2"),
                  '/trackShipment',
                  const Icon(Icons.search)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu3"),
                  '/createShipment',
                  const Icon(Icons.add_box)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu4"),
                  '/myShipment',
                  const Icon(Icons.inbox)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu5"),
                  '/ratesAndServices',
                  const Icon(Icons.monetization_on)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu6"),
                  '/support',
                  const Icon(Icons.support_agent)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu7"),
                  '/findALocation',
                  const Icon(Icons.location_on)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu8"),
                  '/profile',
                  const Icon(Icons.person)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu9"),
                  '/notifications',
                  const Icon(Icons.notifications)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu10"),
                  '/settings',
                  const Icon(Icons.settings)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu11"),
                  '/contact',
                  const Icon(Icons.call)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("menu12"),
                  '/about',
                  const Icon(Icons.person)),
              inkwellMenu(
                  context,
                  AppLocalizations.of(context).getTranslate("Logout"),
                  '/login',
                  const Icon(Icons.logout)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Product(),
          ],
        ),
      ),
    );
  }
}

InkWell inkwellMenu(
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
          const SizedBox(width: 10),
          Text(name),
        ],
      ),
    ),
  );
}

class Product extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Package Delivered',
      message: 'Your package was delivered on June 9, 2024.',
      date: 'June 9, 2024',
    ),
    NotificationItem(
      title: 'Package at Distribution Center',
      message:
          'Your package arrived at the distribution center on June 8, 2024.',
      date: 'June 8, 2024',
    ),
    NotificationItem(
      title: 'Out for Delivery',
      message: 'Your package is out for delivery on June 7, 2024.',
      date: 'June 7, 2024',
    ),
    NotificationItem(
      title: 'Package Arrived at Hub',
      message: 'Your package arrived at the hub on June 6, 2024.',
      date: 'June 6, 2024',
    ),
    NotificationItem(
      title: 'Shipment Picked Up',
      message: 'Your shipment was picked up on June 5, 2024.',
      date: 'June 5, 2024',
    ),
    NotificationItem(
      title: 'Shipment Created',
      message: 'Your shipment was created on June 4, 2024.',
      date: 'June 4, 2024',
    ),
    NotificationItem(
      title: 'Package In Transit',
      message: 'Your package is in transit as of June 3, 2024.',
      date: 'June 3, 2024',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: notifications.map((notification) {
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: Text(notification.date),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String date;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
  });
}

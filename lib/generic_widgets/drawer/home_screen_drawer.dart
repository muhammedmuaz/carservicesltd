import 'package:flutter/material.dart';

import '../../const/design_const.dart';

class CarServicesHomeDrawer extends StatelessWidget {
  const CarServicesHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: DesignConstants.kLogoSecondaryColor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Sidebar Header',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ExpansionTile(
            title: const Text('Transtaltion'),
            children: <Widget>[
              ListTile(
                title: const Text('Sub Option 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Sub Option 2'),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            title: const Text('Share location'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Favourites'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

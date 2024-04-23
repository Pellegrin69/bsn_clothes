import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          // Logo à gauche
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.ac_unit, // Remplacez cela par votre logo
              size: 30,
            ),
          ),
          Text('BSN Clothes'),
        ],
      ),
      actions: [
        // Menu burger à droite
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Scaffold.of(context).Drawer();
            // scaffoldKey.currentState?.openEndDrawer();
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Créer une annonce'),
            onTap: () {
              // Action à effectuer lorsqu'on clique sur "Créer une annonce"
              Navigator.pop(context); // Ferme le drawer
              // Naviguer vers la page de création d'annonce
              Navigator.pushNamed(context, '/form');
            },
          ),
          ListTile(
            title: const Text('Se déconnecter'),
            onTap: () {
              // Action à effectuer lorsqu'on clique sur "Se déconnecter"
              FirebaseAuth.instance.signOut(); // Déconnecte l'utilisateur
              Navigator.pop(context); // Ferme le drawer
              // Naviguer vers la page de connexion
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

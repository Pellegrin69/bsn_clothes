import 'package:flutter/material.dart';
import 'package:bsn_clothes/widgets/navbar.dart';
import 'package:bsn_clothes/widgets/product_preview.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      endDrawer: NavBar.buildDrawer(context),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('articles').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Aucun produit trouvé.'));
          }
          final articles = snapshot.data!.docs;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ProductPreview(
                id: article.get('id'),
                title: article.get('title'),
                picture: article.get('picture'),
                price: article.get('price'),
              );
            },
          );
        },
      ),

      /* body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/product');
            },
            child: const Text('Voir les produits'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/form');
            },
            child: const Text('Créer une annonce'),
          ),
        ],
      )), */
    );
  }
}

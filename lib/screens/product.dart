import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {

    final String productId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produit'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('articles').doc(productId).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('Aucun produit trouvé.'));
          }
          final productData = snapshot.data!.data() as Map<String, dynamic>;
          var image = productData['picture'];
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Carrousel d'images
                SizedBox(
                  height: 300, // Ajustez la hauteur selon vos besoins
                  child: Carousel(
                    imagePaths: [
                      'lib/assets/$image',
                      'lib/assets/image_2.jpg',
                      'lib/assets/image_3.jpg',
                      // Ajoutez d'autres chemins d'images ici si nécessaire
                    ],
                  ),
                ),
                // Titre
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    productData['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Prix
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Prix: ${productData['price']} €',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                // Description
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    productData['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                // Bouton Acheter
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsqu'on appuie sur le bouton Acheter
                  },
                  child: const Text('Acheter'),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}

class Carousel extends StatelessWidget {
  final List<String> imagePaths;

  const Carousel({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          width: 300.0, // Ajustez la largeur selon vos besoins
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

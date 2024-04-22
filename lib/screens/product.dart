import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produit'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Carrousel d'images
          const SizedBox(
            height: 300, // Ajustez la hauteur selon vos besoins
            child: Carousel(
              imagePaths: [
                'lib/assets/image_1.jpg',
                'lib/assets/image_2.jpg',
                'lib/assets/image_3.jpg',
                // Ajoutez d'autres chemins d'images ici si nécessaire
              ],
            ),
          ),
          // Titre
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Nom du Produit',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Prix
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Prix: \$99.99',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          // Description
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Description du produit...',
              style: TextStyle(
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

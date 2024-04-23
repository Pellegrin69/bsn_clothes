import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatelessWidget {
  final TextEditingController brandController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pictureController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un nouvel article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: brandController,
              decoration: const InputDecoration(labelText: 'Marque'),
            ),
            TextField(
              controller: colorController,
              decoration: const InputDecoration(labelText: 'Couleur'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: pictureController,
              decoration: const InputDecoration(labelText: 'Image (nom du fichier dans le dossier "assets")'),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Prix'),
            ),
            TextField(
              controller: sizeController,
              decoration: const InputDecoration(labelText: 'Taille'),
            ),
            ElevatedButton(
              onPressed: () {
                _createArticle(context);
              },
              child: const Text('Créer l\'article'),
            ),
          ],
        ),
      ),
    );
  }

  void _createArticle(BuildContext context) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final newArticle = {
      'title': titleController.text,
      'brand': brandController.text,
      'color': colorController.text,
      'description': descriptionController.text,
      'picture': pictureController.text,
      'price': int.tryParse(priceController.text) ?? 0,
      'size': sizeController.text,
    };

    try {
      DocumentReference newDocument = await _firestore.collection('articles').add(newArticle);
      String documentId = newDocument.id;
      newArticle['id'] = documentId;

      await _firestore.collection('articles').doc(documentId).set(newArticle);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nouvel article créé avec succès'),
      ));

      // Effacer les champs après la création de l'article
      titleController.clear();
      brandController.clear();
      colorController.clear();
      descriptionController.clear();
      pictureController.clear();
      priceController.clear();
      sizeController.clear();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erreur lors de la création de l\'article: $error'),
      ));
    }

    /* _firestore.collection('articles').add(newArticle).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Nouvel article créé avec succès'),
      ));
      // Effacer les champs après la création de l'article
      titleController.clear();
      brandController.clear();
      colorController.clear();
      descriptionController.clear();
      pictureController.clear();
      priceController.clear();
      sizeController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erreur lors de la création de l\'article: $error'),
      ));
    }); */
  }
}

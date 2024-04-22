import 'package:bsn_clothes/features/user_auth/presentation/pages/login_page.dart';
import 'package:bsn_clothes/global/common/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("HomePage"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _createData(ArticleModel(
                    brand: "Nike",
                    color: "red",
                    size: "M",
                  ));
                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Create Data",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              StreamBuilder<List<ArticleModel>>(
                  stream: _readData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Data Yet"));
                    } else {
                      print(snapshot);
                    }
                    final articles = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                          children: articles!.map((article) {
                        return ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              _deleteData(article.id!);
                            },
                            child: const Icon(Icons.delete),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              _updateData(ArticleModel(
                                id: article.id,
                                brand: "Adidas",
                                color: "black",
                                size: "S",
                              ));
                            },
                            child: const Icon(Icons.update),
                          ),
                          title: Text(article.brand!),
                          subtitle: Text(article.color!),
                        );
                      }).toList()),
                    );
                  }),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                  // Navigator.pushNamed(context, "/login");
                  showToast(message: "Successfully signed out");
                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Sign out",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Stream<List<ArticleModel>> _readData() {
    final articleCollection = FirebaseFirestore.instance.collection("articles");

    // return articleCollection.snapshots().map((qureySnapshot) =>
    //     qureySnapshot.docs.map((e) => (ArticleModel.fromSnapshot(e))).toList());
    return articleCollection.snapshots().map((querySnapshot) {
      List<ArticleModel> articles = querySnapshot.docs.map((doc) {
        print("Document: $doc");
        print("Document ID: ${doc.id}");

        return ArticleModel.fromSnapshot(doc);
      }).toList();

      return articles;
    });
  }

  void _createData(ArticleModel articleModel) {
    final articleCollection = FirebaseFirestore.instance.collection("articles");

    String id = articleCollection.doc().id;

    final newArticle = ArticleModel(
      id: id,
      brand: articleModel.brand,
      color: articleModel.color,
      size: articleModel.size,
    ).toJson();

    articleCollection.doc(id).set(newArticle);
  }

  void _updateData(ArticleModel articleModel) {
    final articleCollection = FirebaseFirestore.instance.collection("articles");

    final newData = ArticleModel(
      id: articleModel.id,
      brand: articleModel.brand,
      color: articleModel.color,
      size: articleModel.size,
    ).toJson();

    articleCollection.doc(articleModel.id).update(newData);
  }

  void _deleteData(String id) {
    final articleCollection = FirebaseFirestore.instance.collection("articles");

    articleCollection.doc(id).delete();
  }
}

class ArticleModel {
  final String? id;
  final String? brand;
  final String? color;
  final String? size;

  ArticleModel({this.id, this.brand, this.color, this.size});

  static ArticleModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    try {
      // Vérifier si le document est null ou vide
      if (snapshot == null || !snapshot.exists) {
        throw Exception("Document vide ou inexistant.");
      }

      // Extraire les données du document
      String id = snapshot.get('id') ?? ""; // Valeur par défaut si null
      String brand = snapshot.get('brand') ?? ""; // Valeur par défaut si null
      String color = snapshot.get('color') ?? ""; // Valeur par défaut si null
      String size = snapshot.get('size') ?? ""; // Valeur par défaut si null

      // Créer et retourner un objet ArticleModel
      return ArticleModel(
        id: id,
        brand: brand,
        color: color,
        size: size,
      );
    } catch (e) {
      // Gérer l'exception et afficher un message d'erreur
      print("Erreur lors de la création de l'objet ArticleModel: $e");
      // Vous pouvez choisir de renvoyer null ou un objet ArticleModel avec des valeurs par défaut
      return ArticleModel(
        id: "",
        brand: "",
        color: "",
        size: "",
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "brand": brand,
      "color": color,
      "size": size,
    };
  }
}

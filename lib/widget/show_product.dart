import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poproject/model/product_model.dart';
import 'package:poproject/utility/my_api.dart';
import 'package:poproject/utility/my_style.dart';
import 'package:poproject/widget/detail_product.dart';

class ShowProduct extends StatefulWidget {
  @override
  _ShowProductState createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  List<ProductModel> models = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readProduct();
  }

  Future<Null> readProduct() async {
    print('readProduct Work');

    if (models.length != 0) {
      models.clear();
    }

    await Firebase.initializeApp().then((value) async {
      print('Initial Success');

      await FirebaseFirestore.instance
          .collection('products')
          .snapshots()
          .listen((event) {
        for (var snapshot in event.docs) {
          // print('doc Name ==>> ${snapshot.id}');
          // print('doc Data ==>> ${snapshot.data()}');
          ProductModel model = ProductModel.fromJson(snapshot.data());
          // print('Name Product ==>> ${model.productNameTh}');
          print('sCreateTs ==> ${model.sCreatedTs.toString()}');
          setState(() {
            models.add(model);
          });
        }
      });
    }).catchError((value) {
      print('Error initial ==>> ${value.message}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Show Product'),
      // ),
      body: models.length == 0 ? MyStyle().buildCircular() : buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduct(
              model: models[index],
            ),
          ),
        ).then((value) => readProduct()),
        child: Card(
          color: index % 2 == 0 ? Colors.grey.shade300 : Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            models[index].productNameTh == null
                                ? 'n/a'
                                : models[index].productNameTh,
                            style: MyStyle().titleH2(),
                          ),
                        ],
                      ),
                      Text(
                          MyAPI().checkNull(models[index].productDescriptionTh))
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl: MyAPI().checkNull(models[index].urlToken),
                        placeholder: (context, url) =>
                            MyStyle().buildCircular(),
                        errorWidget: (context, url, error) =>
                            Image.asset('images/question.png'),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

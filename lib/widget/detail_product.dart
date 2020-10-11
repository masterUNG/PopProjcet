import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poproject/model/product_model.dart';
import 'package:poproject/utility/my_api.dart';
import 'package:poproject/utility/my_style.dart';

class DetailProduct extends StatefulWidget {
  final ProductModel model;
  DetailProduct({Key key, this.model}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  ProductModel model;
  File file;
  bool statusLoad = true; // ture dont display CircutalrProgress

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: SizedBox(),
        title: Text(
          model == null
              ? 'Detail Product'
              : MyAPI().checkNull(model.productNameTh),
        ),
        actions: [buildIconButtonBack(context)],
      ),
      body: Stack(
        children: [
          buildContent(),
          statusLoad ? SizedBox() : MyStyle().buildCircular()
        ],
      ),
    );
  }

  Column buildContent() {
    return Column(
      children: [
        Text(
          model.productNameTh,
          style: MyStyle().titleH2(),
        ),
        Text(model.productNameEn),
        Text(
          model.productDescriptionTh,
          style: MyStyle().titleH2(),
        ),
        Text(model.productDescriptionEn),
        buildPicture(),
      ],
    );
  }

  IconButton buildIconButtonBack(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        size: 36,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  Expanded buildPicture() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: file == null
                    ? Image.asset('images/image.png')
                    : Image.file(file),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.blue[700],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () => chooseImage(ImageSource.camera),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.cloud_upload,
                  ),
                  onPressed: () {
                    setState(() {
                      statusLoad = false;
                      uploadImageToFirebase();
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_photo_alternate),
                  onPressed: () => chooseImage(ImageSource.gallery),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );

      setState(() {
        file = File(result.path);
      });
    } catch (e) {}
  }

  Future<Null> uploadImageToFirebase() async {
    int i = Random().nextInt(1000000);
    String nameImage = 'image$i.jpg';

    StorageReference reference =
        FirebaseStorage.instance.ref().child('product/$nameImage');
    StorageUploadTask task = reference.putFile(file);
    String urlToken = await (await task.onComplete).ref.getDownloadURL();
    String docId = model.productId;
    print('docId ==> $docId');

    editValueOnFirestore(urlToken);
  }

  Future<Null> editValueOnFirestore(String urlToken) async {
    Map<String, dynamic> map = Map();
    map['urlToken'] = urlToken;

    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(model.productId)
          .update(map)
          .then((value) {
        print('Success Upload and Update');
        setState(() {
          statusLoad = true;
          Navigator.pop(context);
        });
      });
    } catch (e) {}
  }
}

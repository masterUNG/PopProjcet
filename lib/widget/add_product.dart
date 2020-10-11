import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poproject/model/up_product_model.dart';
import 'package:poproject/utility/my_style.dart';
import 'package:poproject/widget/my_service.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String corporate, productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildText(),
            buildCorporate(),
            buildNameTh(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        if (corporate == null ||
            corporate.isEmpty ||
            productName == null ||
            productName.isEmpty) {
          normalDialog();
        } else {
          uploadDataToServer();
        }
      },
      child: Icon(Icons.cloud_upload),
    );
  }

  Future<Null> uploadDataToServer() async {
    String urlAPI =
        'https://asia-east2-tbit-merchant-a.cloudfunctions.net/products/create';

    UpProductModel model = UpProductModel(
        corporateId: corporate,
        productDescriptionTh: productName,
        brandNameEn: 'TestMasterUng',
        brandNameTh: 'TestMasterUng',
        createBy: 'TestMasterUng',
        productLPTT: 123,
        productSRP: 456,
        productCategory: 'TestMasterUng',
        productDescriptionEn: 'TestMasterUng',
        productNameTh: 'TestMasterUng',
        productId: 'TestMasterUng',
        productNameEn: 'TestMasterUng',
        unit: 'TestMasterUng');

    Map<String, dynamic> map = model.toJson();

    await Dio().post(urlAPI, data: map).then((value) {
      print('Success Upload Product');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyService(),
          ),
          (route) => false);
    }).catchError((value) {
      print('error Upload Product ==>> ${value.toString()}');
    });
  }

  Future<Null> normalDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Have Space ?'),
        children: [
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Text('Please Fill Every Blank'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK')),
            ],
          )
        ],
      ),
    );
  }

  Container buildCorporate() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => corporate = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.fingerprint),
          labelText: 'CorporateID :',
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Container buildNameTh() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => productName = value.trim(),
        decoration: InputDecoration(
          hintText: 'พิมพ์ ภาษาไทย นะครับ',
          prefixIcon: Icon(Icons.face),
          labelText: 'Product Name :',
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Text buildText() {
    return Text(
      'Please Fill in Blank',
      style: MyStyle().titleH1(),
    );
  }
}

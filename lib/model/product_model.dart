import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String productId;
  String brandNameEn;
  String productDescriptionTh;
  String productNameTh;
  String sUpdatedBy;
  String sCreatedBy;
  String productDescriptionEn;
  double productSRP;
  double productLPTT;
  String brandNameTh;
  String productNameEn;
  String productStatus;
  String unit;
  String productImg;
  String productCategory;
  String corporateId;
  Timestamp sCreatedTs;
  Timestamp sUpdatedTs;
  String urlToken;

  ProductModel(
      {this.productId,
      this.brandNameEn,
      this.productDescriptionTh,
      this.productNameTh,
      this.sUpdatedBy,
      this.sCreatedBy,
      this.productDescriptionEn,
      this.productSRP,
      this.productLPTT,
      this.brandNameTh,
      this.productNameEn,
      this.productStatus,
      this.unit,
      this.productImg,
      this.productCategory,
      this.corporateId,
      this.sCreatedTs,
      this.sUpdatedTs,
      this.urlToken});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    brandNameEn = json['brand_name_en'];
    productDescriptionTh = json['product_description_th'];
    productNameTh = json['product_name_th'];
    sUpdatedBy = json['_updated_by'];
    sCreatedBy = json['_created_by'];
    productDescriptionEn = json['product_description_en'];
    productSRP = json['product_SRP'];
    productLPTT = json['product_LPTT'];
    brandNameTh = json['brand_name_th'];
    productNameEn = json['product_name_en'];
    productStatus = json['product_status'];
    unit = json['unit'];
    productImg = json['product_img'];
    productCategory = json['product_category'];
    corporateId = json['corporate_id'];
    sCreatedTs = json['_created_ts'];
    sUpdatedTs = json['_updated_ts'];
    urlToken = json['urlToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['brand_name_en'] = this.brandNameEn;
    data['product_description_th'] = this.productDescriptionTh;
    data['product_name_th'] = this.productNameTh;
    data['_updated_by'] = this.sUpdatedBy;
    data['_created_by'] = this.sCreatedBy;
    data['product_description_en'] = this.productDescriptionEn;
    data['product_SRP'] = this.productSRP;
    data['product_LPTT'] = this.productLPTT;
    data['brand_name_th'] = this.brandNameTh;
    data['product_name_en'] = this.productNameEn;
    data['product_status'] = this.productStatus;
    data['unit'] = this.unit;
    data['product_img'] = this.productImg;
    data['product_category'] = this.productCategory;
    data['corporate_id'] = this.corporateId;
    data['_created_ts'] = this.sCreatedTs;
    data['_updated_ts'] = this.sUpdatedTs;
    data['urlToken'] = this.urlToken;
    return data;
  }
}

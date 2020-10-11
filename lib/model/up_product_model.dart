class UpProductModel {
  String brandNameEn;
  String brandNameTh;
  String corporateId;
  String createBy;
  int productLPTT;
  int productSRP;
  String productCategory;
  String productDescriptionEn;
  String productDescriptionTh;
  String productId;
  String productNameEn;
  String productNameTh;
  String unit;

  UpProductModel(
      {this.brandNameEn,
      this.brandNameTh,
      this.corporateId,
      this.createBy,
      this.productLPTT,
      this.productSRP,
      this.productCategory,
      this.productDescriptionEn,
      this.productDescriptionTh,
      this.productId,
      this.productNameEn,
      this.productNameTh,
      this.unit});

  UpProductModel.fromJson(Map<String, dynamic> json) {
    brandNameEn = json['brand_name_en'];
    brandNameTh = json['brand_name_th'];
    corporateId = json['corporate_id'];
    createBy = json['create_by'];
    productLPTT = json['product_LPTT'];
    productSRP = json['product_SRP'];
    productCategory = json['product_category'];
    productDescriptionEn = json['product_description_en'];
    productDescriptionTh = json['product_description_th'];
    productId = json['product_id'];
    productNameEn = json['product_name_en'];
    productNameTh = json['product_name_th'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_name_en'] = this.brandNameEn;
    data['brand_name_th'] = this.brandNameTh;
    data['corporate_id'] = this.corporateId;
    data['create_by'] = this.createBy;
    data['product_LPTT'] = this.productLPTT;
    data['product_SRP'] = this.productSRP;
    data['product_category'] = this.productCategory;
    data['product_description_en'] = this.productDescriptionEn;
    data['product_description_th'] = this.productDescriptionTh;
    data['product_id'] = this.productId;
    data['product_name_en'] = this.productNameEn;
    data['product_name_th'] = this.productNameTh;
    data['unit'] = this.unit;
    return data;
  }
}


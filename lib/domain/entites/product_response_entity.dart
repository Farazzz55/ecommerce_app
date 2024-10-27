class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});

  num? results;
  ProductMetadataEntity? metadata;
  List<ProductDataEntity>? data;


}

class ProductDataEntity {
  ProductDataEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt,
    this.isFavorite=false ,

  });

  num? sold;
  List<String>? images;
  List<ProductSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  ProductCategoryEntity? category;
  ProductBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  bool isFavorite;


}

class ProductBrandEntity {
  ProductBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;


}

class ProductCategoryEntity {
  ProductCategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});

  String? id;
  String? name;
  String? slug;
  String? image;


}

class ProductSubcategoryEntity {
  ProductSubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;


}

class ProductMetadataEntity {
  ProductMetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;


}
class ComplexModal {
  bool? success;
  String? message;
  List<Data>? data;

  ComplexModal({
    this.success,
    this.message,
    this.data,
  });

  ComplexModal.fromJson(Map<String, dynamic> json) {
    success = json['success'] as bool?;
    message = json['message'] as String?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['success'] = success;
    json['message'] = message;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Data {
  String? id;
  bool? onSale;
  int? salePercent;
  int? sold;
  bool? sliderNew;
  bool? sliderRecent;
  bool? sliderSold;
  String? date;
  String? title;
  Categories? categories;
  Subcat? subcat;
  Shop? shop;
  String? price;
  String? saleTitle;
  String? salePrice;
  String? description;
  String? color;
  String? size;
  bool? inWishlist;
  List<Images>? images;

  Data({
    this.id,
    this.onSale,
    this.salePercent,
    this.sold,
    this.sliderNew,
    this.sliderRecent,
    this.sliderSold,
    this.date,
    this.title,
    this.categories,
    this.subcat,
    this.shop,
    this.price,
    this.saleTitle,
    this.salePrice,
    this.description,
    this.color,
    this.size,
    this.inWishlist,
    this.images,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    onSale = json['on_sale'] as bool?;
    salePercent = json['sale_percent'] as int?;
    sold = json['sold'] as int?;
    sliderNew = json['slider_new'] as bool?;
    sliderRecent = json['slider_recent'] as bool?;
    sliderSold = json['slider_sold'] as bool?;
    date = json['date'] as String?;
    title = json['title'] as String?;
    categories = (json['categories'] as Map<String,dynamic>?) != null ? Categories.fromJson(json['categories'] as Map<String,dynamic>) : null;
    subcat = (json['subcat'] as Map<String,dynamic>?) != null ? Subcat.fromJson(json['subcat'] as Map<String,dynamic>) : null;
    shop = (json['shop'] as Map<String,dynamic>?) != null ? Shop.fromJson(json['shop'] as Map<String,dynamic>) : null;
    price = json['price'] as String?;
    saleTitle = json['sale_title'] as String?;
    salePrice = json['sale_price'] as String?;
    description = json['description'] as String?;
    color = json['color'] as String?;
    size = json['size'] as String?;
    inWishlist = json['in_wishlist'] as bool?;
    images = (json['images'] as List?)?.map((dynamic e) => Images.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['on_sale'] = onSale;
    json['sale_percent'] = salePercent;
    json['sold'] = sold;
    json['slider_new'] = sliderNew;
    json['slider_recent'] = sliderRecent;
    json['slider_sold'] = sliderSold;
    json['date'] = date;
    json['title'] = title;
    json['categories'] = categories?.toJson();
    json['subcat'] = subcat?.toJson();
    json['shop'] = shop?.toJson();
    json['price'] = price;
    json['sale_title'] = saleTitle;
    json['sale_price'] = salePrice;
    json['description'] = description;
    json['color'] = color;
    json['size'] = size;
    json['in_wishlist'] = inWishlist;
    json['images'] = images?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Categories {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;
  String? image;

  Categories({
    this.id,
    this.type,
    this.salePercent,
    this.date,
    this.name,
    this.image,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    type = json['type'] as String?;
    salePercent = json['sale_percent'] as int?;
    date = json['date'] as String?;
    name = json['name'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['type'] = type;
    json['sale_percent'] = salePercent;
    json['date'] = date;
    json['name'] = name;
    json['image'] = image;
    return json;
  }
}

class Subcat {
  String? id;
  String? type;
  int? salePercent;
  String? date;
  String? name;

  Subcat({
    this.id,
    this.type,
    this.salePercent,
    this.date,
    this.name,
  });

  Subcat.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    type = json['type'] as String?;
    salePercent = json['sale_percent'] as int?;
    date = json['date'] as String?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['type'] = type;
    json['sale_percent'] = salePercent;
    json['date'] = date;
    json['name'] = name;
    return json;
  }
}

class Shop {
  String? id;
  bool? isActive;
  String? createdAt;
  String? name;
  String? description;
  String? shopemail;
  String? shopaddress;
  String? shopcity;
  String? userid;
  String? image;

  Shop({
    this.id,
    this.isActive,
    this.createdAt,
    this.name,
    this.description,
    this.shopemail,
    this.shopaddress,
    this.shopcity,
    this.userid,
    this.image,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    isActive = json['is_active'] as bool?;
    createdAt = json['created_At'] as String?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    shopemail = json['shopemail'] as String?;
    shopaddress = json['shopaddress'] as String?;
    shopcity = json['shopcity'] as String?;
    userid = json['userid'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['is_active'] = isActive;
    json['created_At'] = createdAt;
    json['name'] = name;
    json['description'] = description;
    json['shopemail'] = shopemail;
    json['shopaddress'] = shopaddress;
    json['shopcity'] = shopcity;
    json['userid'] = userid;
    json['image'] = image;
    return json;
  }
}

class Images {
  String? id;
  String? url;

  Images({
    this.id,
    this.url,
  });

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['url'] = url;
    return json;
  }
}
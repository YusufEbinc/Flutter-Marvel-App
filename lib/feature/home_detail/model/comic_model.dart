// To parse this JSON data, do
//
//     final uploadImageModel = uploadImageModelFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_conditional_assignment, constant_identifier_names, prefer_null_aware_operators

import 'dart:convert';

ComicsModel uploadImageModelFromMap(String? str) =>
    ComicsModel.fromMap(json.decode(str!));

class ComicsModel {
  ComicsModel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  factory ComicsModel.fromMap(Map<String, dynamic> json) => ComicsModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        attributionText:
            json["attributionText"] == null ? null : json["attributionText"],
        attributionHtml:
            json["attributionHTML"] == null ? null : json["attributionHTML"],
        etag: json["etag"] == null ? null : json["etag"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        total: json["total"] == null ? null : json["total"],
        count: json["count"] == null ? null : json["count"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
      );
}

class Result {
  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<TextObject>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? events;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        digitalId: json["digitalId"] == null ? null : json["digitalId"],
        title: json["title"] == null ? null : json["title"],
        issueNumber: json["issueNumber"] == null ? null : json["issueNumber"],
        variantDescription: json["variantDescription"] == null
            ? null
            : json["variantDescription"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"] == null ? null : json["modified"],
        isbn: json["isbn"] == null ? null : json["isbn"],
        upc: json["upc"] == null ? null : json["upc"],
        diamondCode: json["diamondCode"] == null ? null : json["diamondCode"],
        ean: json["ean"] == null ? null : json["ean"],
        issn: json["issn"] == null ? null : json["issn"],
        format: json["format"] == null ? null : json["format"],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        textObjects: json["textObjects"] == null
            ? null
            : List<TextObject>.from(
                json["textObjects"].map((x) => TextObject.fromMap(x))),
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        urls: json["urls"] == null
            ? null
            : List<Url>.from(json["urls"].map((x) => Url.fromMap(x))),
        series: json["series"] == null ? null : Series.fromMap(json["series"]),
        variants: json["variants"] == null
            ? null
            : List<Series>.from(json["variants"].map((x) => Series.fromMap(x))),
        collections: json["collections"] == null
            ? null
            : List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: json["collectedIssues"] == null
            ? null
            : List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: json["dates"] == null
            ? null
            : List<Date>.from(json["dates"].map((x) => Date.fromMap(x))),
        prices: json["prices"] == null
            ? null
            : List<Price>.from(json["prices"].map((x) => Price.fromMap(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
        images: json["images"] == null
            ? null
            : List<Thumbnail>.from(
                json["images"].map((x) => Thumbnail.fromMap(x))),
        creators: json["creators"] == null
            ? null
            : Creators.fromMap(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromMap(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromMap(json["stories"]),
        events:
            json["events"] == null ? null : Characters.fromMap(json["events"]),
      );
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Series>? items;
  int? returned;

  factory Characters.fromMap(Map<String, dynamic> json) => Characters(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<Series>.from(json["items"].map((x) => Series.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Series.fromMap(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
      );
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<CreatorsItem>? items;
  int? returned;

  factory Creators.fromMap(Map<String, dynamic> json) => Creators(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<CreatorsItem>.from(
                json["items"].map((x) => CreatorsItem.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );
}

class CreatorsItem {
  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  String? resourceUri;
  String? name;
  Role? role;

  factory CreatorsItem.fromMap(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : roleValues.map![json["role"]],
      );
}

enum Role {
  EDITOR,
  LETTERER,
  PENCILLER,
  WRITER,
  COLORIST,
  INKER,
  PENCILLER_COVER
}

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  Date({
    this.type,
    this.date,
  });

  DateType? type;
  String? date;

  factory Date.fromMap(Map<String, dynamic> json) => Date(
        type: json["type"] == null ? null : dateTypeValues.map![json["type"]],
        date: json["date"] == null ? null : json["date"],
      );
}

enum DateType { ONSALE_DATE, FOC_DATE, UNLIMITED_DATE, DIGITAL_PURCHASE_DATE }

final dateTypeValues = EnumValues({
  "digitalPurchaseDate": DateType.DIGITAL_PURCHASE_DATE,
  "focDate": DateType.FOC_DATE,
  "onsaleDate": DateType.ONSALE_DATE,
  "unlimitedDate": DateType.UNLIMITED_DATE
});

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String? path;
  Extension? extension;

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        path: json["path"] == null ? null : json["path"],
        extension: json["extension"] == null
            ? null
            : extensionValues.map![json["extension"]],
      );
}

enum Extension { JPG }

final extensionValues = EnumValues({"jpg": Extension.JPG});

class Price {
  Price({
    this.type,
    this.price,
  });

  PriceType? type;
  double? price;

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        type: json["type"] == null ? null : priceTypeValues.map![json["type"]],
        price: json["price"] == null ? null : json["price"].toDouble(),
      );
}

enum PriceType { PRINT_PRICE, DIGITAL_PURCHASE_PRICE }

final priceTypeValues = EnumValues({
  "digitalPurchasePrice": PriceType.DIGITAL_PURCHASE_PRICE,
  "printPrice": PriceType.PRINT_PRICE
});

class Stories {
  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  factory Stories.fromMap(Map<String, dynamic> json) => Stories(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<StoriesItem>.from(
                json["items"].map((x) => StoriesItem.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );
}

class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  String? resourceUri;
  String? name;
  ItemType? type;

  factory StoriesItem.fromMap(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : itemTypeValues.map![json["type"]],
      );
}

enum ItemType { COVER, INTERIOR_STORY }

final itemTypeValues = EnumValues(
    {"cover": ItemType.COVER, "interiorStory": ItemType.INTERIOR_STORY});

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  TextObjectType? type;
  Language? language;
  String? text;

  factory TextObject.fromMap(Map<String, dynamic> json) => TextObject(
        type: json["type"] == null
            ? null
            : textObjectTypeValues.map![json["type"]],
        language: json["language"] == null
            ? null
            : languageValues.map![json["language"]],
        text: json["text"] == null ? null : json["text"],
      );
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_PREVIEW_TEXT, ISSUE_SOLICIT_TEXT }

final textObjectTypeValues = EnumValues({
  "issue_preview_text": TextObjectType.ISSUE_PREVIEW_TEXT,
  "issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT
});

class Url {
  Url({
    this.type,
    this.url,
  });

  UrlType? type;
  String? url;

  factory Url.fromMap(Map<String, dynamic> json) => Url(
        type: json["type"] == null ? null : urlTypeValues.map![json["type"]],
        url: json["url"] == null ? null : json["url"],
      );
}

enum UrlType { DETAIL, PURCHASE, READER, IN_APP_LINK }

final urlTypeValues = EnumValues({
  "detail": UrlType.DETAIL,
  "inAppLink": UrlType.IN_APP_LINK,
  "purchase": UrlType.PURCHASE,
  "reader": UrlType.READER
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}

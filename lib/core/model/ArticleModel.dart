// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  String status;
  String copyright;
  String section;
  DateTime lastUpdated;
  int numResults;
  List<Result> results;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    status: json["status"] == null ? null : json["status"],
    copyright: json["copyright"] == null ? null : json["copyright"],
    section: json["section"] == null ? null : json["section"],
    lastUpdated: json["last_updated"] == null
        ? null
        : DateTime.parse(json["last_updated"]),
    numResults: json["num_results"] == null ? null : json["num_results"],
    results: json["results"] == null
        ? null
        : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "copyright": copyright == null ? null : copyright,
    "section": section == null ? null : section,
    "last_updated":
    lastUpdated == null ? null : lastUpdated.toIso8601String(),
    "num_results": numResults == null ? null : numResults,
    "results": results == null
        ? null
        : List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.section,
    this.subsection,
    this.title,
    this.resultAbstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.materialTypeFacet,
    this.kicker,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.multimedia,
    this.shortUrl,
  });

  String section;
  String subsection;
  String title;
  String resultAbstract;
  String url;
  String uri;
  String byline;
  ItemType itemType;
  DateTime updatedDate;
  DateTime createdDate;
  DateTime publishedDate;
  String materialTypeFacet;
  String kicker;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<String> geoFacet;
  List<Multimedia> multimedia;
  String shortUrl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    section: json["section"] == null ? null : json["section"],
    subsection: json["subsection"] == null ? null : json["subsection"],
    title: json["title"] == null ? null : json["title"],
    resultAbstract: json["abstract"] == null ? null : json["abstract"],
    url: json["url"] == null ? null : json["url"],
    uri: json["uri"] == null ? null : json["uri"],
    byline: json["byline"] == null ? null : json["byline"],
    itemType: json["item_type"] == null
        ? null
        : itemTypeValues.map[json["item_type"]],
    updatedDate: json["updated_date"] == null
        ? null
        : DateTime.parse(json["updated_date"]),
    createdDate: json["created_date"] == null
        ? null
        : DateTime.parse(json["created_date"]),
    publishedDate: json["published_date"] == null
        ? null
        : DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"] == null
        ? null
        : json["material_type_facet"],
    kicker: json["kicker"] == null ? null : json["kicker"],
    desFacet: json["des_facet"] == null
        ? null
        : List<String>.from(json["des_facet"].map((x) => x)),
    orgFacet: json["org_facet"] == null
        ? null
        : List<String>.from(json["org_facet"].map((x) => x)),
    perFacet: json["per_facet"] == null
        ? null
        : List<String>.from(json["per_facet"].map((x) => x)),
    geoFacet: json["geo_facet"] == null
        ? null
        : List<String>.from(json["geo_facet"].map((x) => x)),
    multimedia: json["multimedia"] == null
        ? null
        : List<Multimedia>.from(
        json["multimedia"].map((x) => Multimedia.fromJson(x))),
    shortUrl: json["short_url"] == null ? null : json["short_url"],
  );

  Map<String, dynamic> toJson() => {
    "section": section == null ? null : section,
    "subsection": subsection == null ? null : subsection,
    "title": title == null ? null : title,
    "abstract": resultAbstract == null ? null : resultAbstract,
    "url": url == null ? null : url,
    "uri": uri == null ? null : uri,
    "byline": byline == null ? null : byline,
    "item_type": itemType == null ? null : itemTypeValues.reverse[itemType],
    "updated_date":
    updatedDate == null ? null : updatedDate.toIso8601String(),
    "created_date":
    createdDate == null ? null : createdDate.toIso8601String(),
    "published_date":
    publishedDate == null ? null : publishedDate.toIso8601String(),
    "material_type_facet":
    materialTypeFacet == null ? null : materialTypeFacet,
    "kicker": kicker == null ? null : kicker,
    "des_facet": desFacet == null
        ? null
        : List<dynamic>.from(desFacet.map((x) => x)),
    "org_facet": orgFacet == null
        ? null
        : List<dynamic>.from(orgFacet.map((x) => x)),
    "per_facet": perFacet == null
        ? null
        : List<dynamic>.from(perFacet.map((x) => x)),
    "geo_facet": geoFacet == null
        ? null
        : List<dynamic>.from(geoFacet.map((x) => x)),
    "multimedia": multimedia == null
        ? null
        : List<dynamic>.from(multimedia.map((x) => x.toJson())),
    "short_url": shortUrl == null ? null : shortUrl,
  };
}

enum ItemType { ARTICLE }

final itemTypeValues = EnumValues({"Article": ItemType.ARTICLE});

class Multimedia {
  Multimedia({
    this.url,
    this.format,
    this.height,
    this.width,
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
  });

  String url;
  Format format;
  int height;
  int width;
  Type type;
  Subtype subtype;
  String caption;
  String copyright;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"] == null ? null : json["url"],
    format:
    json["format"] == null ? null : formatValues.map[json["format"]],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
    type: json["type"] == null ? null : typeValues.map[json["type"]],
    subtype:
    json["subtype"] == null ? null : subtypeValues.map[json["subtype"]],
    caption: json["caption"] == null ? null : json["caption"],
    copyright: json["copyright"] == null ? null : json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "format": format == null ? null : formatValues.reverse[format],
    "height": height == null ? null : height,
    "width": width == null ? null : width,
    "type": type == null ? null : typeValues.reverse[type],
    "subtype": subtype == null ? null : subtypeValues.reverse[subtype],
    "caption": caption == null ? null : caption,
    "copyright": copyright == null ? null : copyright,
  };
}

enum Format {
  SUPER_JUMBO,
  STANDARD_THUMBNAIL,
  THUMB_LARGE,
  MEDIUM_THREE_BY_TWO210,
  NORMAL
}

final formatValues = EnumValues({
  "mediumThreeByTwo210": Format.MEDIUM_THREE_BY_TWO210,
  "Normal": Format.NORMAL,
  "Standard Thumbnail": Format.STANDARD_THUMBNAIL,
  "superJumbo": Format.SUPER_JUMBO,
  "thumbLarge": Format.THUMB_LARGE
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({"photo": Subtype.PHOTO});

enum Type { IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

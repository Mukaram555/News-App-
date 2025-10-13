// // To parse this JSON data, do
// //
// //     final newsModelWorld = newsModelWorldFromJson(jsonString);

// import 'dart:convert';

// NewsModelWorld newsModelWorldFromJson(String str) =>
//     NewsModelWorld.fromJson(json.decode(str));

// String newsModelWorldToJson(NewsModelWorld data) => json.encode(data.toJson());

// class NewsModelWorld {
//   final String status;
//   final String copyright;
//   final String section;
//   final DateTime lastUpdated;
//   final int numResults;
//   final List<Result> results;

//   NewsModelWorld({
//     required this.status,
//     required this.copyright,
//     required this.section,
//     required this.lastUpdated,
//     required this.numResults,
//     required this.results,
//   });

//   factory NewsModelWorld.fromJson(Map<String, dynamic> json) => NewsModelWorld(
//     status: json["status"],
//     copyright: json["copyright"],
//     section: json["section"],
//     lastUpdated: DateTime.parse(json["last_updated"]),
//     numResults: json["num_results"],
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//   );

//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "copyright": copyright,
//     "section": section,
//     "last_updated": lastUpdated.toIso8601String(),
//     "num_results": numResults,
//     "results": List<dynamic>.from(results.map((x) => x.toJson())),
//   };
// }

// class Result {
//   final Section section;
//   final String subsection;
//   final String title;
//   final String resultAbstract;
//   final String url;
//   final String uri;
//   final String byline;
//   final ItemType itemType;
//   final DateTime updatedDate;
//   final DateTime createdDate;
//   final DateTime publishedDate;
//   final String materialTypeFacet;
//   final Kicker kicker;
//   final List<String> desFacet;
//   final List<String> orgFacet;
//   final List<String> perFacet;
//   final List<String> geoFacet;
//   final List<Multimedia> multimedia;
//   final String shortUrl;

//   Result({
//     required this.section,
//     required this.subsection,
//     required this.title,
//     required this.resultAbstract,
//     required this.url,
//     required this.uri,
//     required this.byline,
//     required this.itemType,
//     required this.updatedDate,
//     required this.createdDate,
//     required this.publishedDate,
//     required this.materialTypeFacet,
//     required this.kicker,
//     required this.desFacet,
//     required this.orgFacet,
//     required this.perFacet,
//     required this.geoFacet,
//     required this.multimedia,
//     required this.shortUrl,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     section: sectionValues.map[json["section"]]!,
//     subsection: json["subsection"],
//     title: json["title"],
//     resultAbstract: json["abstract"],
//     url: json["url"],
//     uri: json["uri"],
//     byline: json["byline"],
//     itemType: itemTypeValues.map[json["item_type"]]!,
//     updatedDate: DateTime.parse(json["updated_date"]),
//     createdDate: DateTime.parse(json["created_date"]),
//     publishedDate: DateTime.parse(json["published_date"]),
//     materialTypeFacet: json["material_type_facet"],
//     kicker: kickerValues.map[json["kicker"]]!,
//     desFacet: List<String>.from(json["des_facet"].map((x) => x)),
//     orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
//     perFacet: List<String>.from(json["per_facet"].map((x) => x)),
//     geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
//     multimedia: List<Multimedia>.from(
//       json["multimedia"].map((x) => Multimedia.fromJson(x)),
//     ),
//     shortUrl: json["short_url"],
//   );

//   Map<String, dynamic> toJson() => {
//     "section": sectionValues.reverse[section],
//     "subsection": subsection,
//     "title": title,
//     "abstract": resultAbstract,
//     "url": url,
//     "uri": uri,
//     "byline": byline,
//     "item_type": itemTypeValues.reverse[itemType],
//     "updated_date": updatedDate.toIso8601String(),
//     "created_date": createdDate.toIso8601String(),
//     "published_date": publishedDate.toIso8601String(),
//     "material_type_facet": materialTypeFacet,
//     "kicker": kickerValues.reverse[kicker],
//     "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
//     "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
//     "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
//     "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
//     "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
//     "short_url": shortUrl,
//   };
// }

// enum ItemType { ARTICLE, INTERACTIVE }

// final itemTypeValues = EnumValues({
//   "Article": ItemType.ARTICLE,
//   "Interactive": ItemType.INTERACTIVE,
// });

// enum Kicker { EMPTY, NEWS_ANALYSIS, PET_THEORY, TRILOBITES }

// final kickerValues = EnumValues({
//   "": Kicker.EMPTY,
//   "news analysis": Kicker.NEWS_ANALYSIS,
//   "Pet Theory": Kicker.PET_THEORY,
//   "Trilobites": Kicker.TRILOBITES,
// });

// class Multimedia {
//   final String url;
//   final Format format;
//   final int height;
//   final int width;
//   final Type type;
//   final Subtype subtype;
//   final String caption;
//   final String copyright;

//   Multimedia({
//     required this.url,
//     required this.format,
//     required this.height,
//     required this.width,
//     required this.type,
//     required this.subtype,
//     required this.caption,
//     required this.copyright,
//   });

//   factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
//     url: json["url"],
//     format: formatValues.map[json["format"]]!,
//     height: json["height"],
//     width: json["width"],
//     type: typeValues.map[json["type"]]!,
//     subtype: subtypeValues.map[json["subtype"]]!,
//     caption: json["caption"],
//     copyright: json["copyright"],
//   );

//   Map<String, dynamic> toJson() => {
//     "url": url,
//     "format": formatValues.reverse[format],
//     "height": height,
//     "width": width,
//     "type": typeValues.reverse[type],
//     "subtype": subtypeValues.reverse[subtype],
//     "caption": caption,
//     "copyright": copyright,
//   };
// }

// enum Format { LARGE_THUMBNAIL, SUPER_JUMBO, THREE_BY_TWO_SMALL_AT2_X }

// final formatValues = EnumValues({
//   "Large Thumbnail": Format.LARGE_THUMBNAIL,
//   "Super Jumbo": Format.SUPER_JUMBO,
//   "threeByTwoSmallAt2X": Format.THREE_BY_TWO_SMALL_AT2_X,
// });

// enum Subtype { PHOTO }

// final subtypeValues = EnumValues({"photo": Subtype.PHOTO});

// enum Type { IMAGE }

// final typeValues = EnumValues({"image": Type.IMAGE});

// enum Section { BOOKS, SCIENCE, US, WORLD }

// final sectionValues = EnumValues({
//   "books": Section.BOOKS,
//   "science": Section.SCIENCE,
//   "us": Section.US,
//   "world": Section.WORLD,
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

import 'dart:convert';

class NewsModel {
  final String? status;
  final String? copyright;
  final String? section;
  final DateTime? lastUpdated;
  final int? numResults;
  final List<Result>? results;

  NewsModel({
    this.status,
    this.copyright,
    this.section,
    this.lastUpdated,
    this.numResults,
    this.results,
  });

  NewsModel copyWith({
    String? status,
    String? copyright,
    String? section,
    DateTime? lastUpdated,
    int? numResults,
    List<Result>? results,
  }) => NewsModel(
    status: status ?? this.status,
    copyright: copyright ?? this.copyright,
    section: section ?? this.section,
    lastUpdated: lastUpdated ?? this.lastUpdated,
    numResults: numResults ?? this.numResults,
    results: results ?? this.results,
  );

  factory NewsModel.fromRawJson(String str) =>
      NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    copyright: json["copyright"],
    section: json["section"],
    lastUpdated: json["last_updated"] == null
        ? null
        : DateTime.parse(json["last_updated"]),
    numResults: json["num_results"],
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "section": section,
    "last_updated": lastUpdated?.toIso8601String(),
    "num_results": numResults,
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  final String? section;
  final String? subsection;
  final String? title;
  final String? resultAbstract;
  final String? url;
  final String? uri;
  final String? byline;
  final String? itemType;
  final DateTime? updatedDate;
  final DateTime? createdDate;
  final DateTime? publishedDate;
  final String? materialTypeFacet;
  final String? kicker;
  final List<String>? desFacet;
  final List<String>? orgFacet;
  final List<String>? perFacet;
  final List<String>? geoFacet;
  final List<Multimedia>? multimedia;
  final String? shortUrl;

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

  Result copyWith({
    String? section,
    String? subsection,
    String? title,
    String? resultAbstract,
    String? url,
    String? uri,
    String? byline,
    String? itemType,
    DateTime? updatedDate,
    DateTime? createdDate,
    DateTime? publishedDate,
    String? materialTypeFacet,
    String? kicker,
    List<String>? desFacet,
    List<String>? orgFacet,
    List<String>? perFacet,
    List<String>? geoFacet,
    List<Multimedia>? multimedia,
    String? shortUrl,
  }) => Result(
    section: section ?? this.section,
    subsection: subsection ?? this.subsection,
    title: title ?? this.title,
    resultAbstract: resultAbstract ?? this.resultAbstract,
    url: url ?? this.url,
    uri: uri ?? this.uri,
    byline: byline ?? this.byline,
    itemType: itemType ?? this.itemType,
    updatedDate: updatedDate ?? this.updatedDate,
    createdDate: createdDate ?? this.createdDate,
    publishedDate: publishedDate ?? this.publishedDate,
    materialTypeFacet: materialTypeFacet ?? this.materialTypeFacet,
    kicker: kicker ?? this.kicker,
    desFacet: desFacet ?? this.desFacet,
    orgFacet: orgFacet ?? this.orgFacet,
    perFacet: perFacet ?? this.perFacet,
    geoFacet: geoFacet ?? this.geoFacet,
    multimedia: multimedia ?? this.multimedia,
    shortUrl: shortUrl ?? this.shortUrl,
  );

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    section: json["section"],
    subsection: json["subsection"],
    title: json["title"],
    resultAbstract: json["abstract"],
    url: json["url"],
    uri: json["uri"],
    byline: json["byline"],
    itemType: json["item_type"],
    updatedDate: json["updated_date"] == null
        ? null
        : DateTime.parse(json["updated_date"]),
    createdDate: json["created_date"] == null
        ? null
        : DateTime.parse(json["created_date"]),
    publishedDate: json["published_date"] == null
        ? null
        : DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"],
    kicker: json["kicker"],
    desFacet: json["des_facet"] == null
        ? []
        : List<String>.from(json["des_facet"]!.map((x) => x)),
    orgFacet: json["org_facet"] == null
        ? []
        : List<String>.from(json["org_facet"]!.map((x) => x)),
    perFacet: json["per_facet"] == null
        ? []
        : List<String>.from(json["per_facet"]!.map((x) => x)),
    geoFacet: json["geo_facet"] == null
        ? []
        : List<String>.from(json["geo_facet"]!.map((x) => x)),
    multimedia: json["multimedia"] == null
        ? []
        : List<Multimedia>.from(
            json["multimedia"]!.map((x) => Multimedia.fromJson(x)),
          ),
    shortUrl: json["short_url"],
  );

  Map<String, dynamic> toJson() => {
    "section": section,
    "subsection": subsection,
    "title": title,
    "abstract": resultAbstract,
    "url": url,
    "uri": uri,
    "byline": byline,
    "item_type": itemType,
    "updated_date": updatedDate?.toIso8601String(),
    "created_date": createdDate?.toIso8601String(),
    "published_date": publishedDate?.toIso8601String(),
    "material_type_facet": materialTypeFacet,
    "kicker": kicker,
    "des_facet": desFacet == null
        ? []
        : List<dynamic>.from(desFacet!.map((x) => x)),
    "org_facet": orgFacet == null
        ? []
        : List<dynamic>.from(orgFacet!.map((x) => x)),
    "per_facet": perFacet == null
        ? []
        : List<dynamic>.from(perFacet!.map((x) => x)),
    "geo_facet": geoFacet == null
        ? []
        : List<dynamic>.from(geoFacet!.map((x) => x)),
    "multimedia": multimedia == null
        ? []
        : List<dynamic>.from(multimedia!.map((x) => x.toJson())),
    "short_url": shortUrl,
  };
}

class Multimedia {
  final String? url;
  final String? format;
  final int? height;
  final int? width;
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;

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

  Multimedia copyWith({
    String? url,
    String? format,
    int? height,
    int? width,
    String? type,
    String? subtype,
    String? caption,
    String? copyright,
  }) => Multimedia(
    url: url ?? this.url,
    format: format ?? this.format,
    height: height ?? this.height,
    width: width ?? this.width,
    type: type ?? this.type,
    subtype: subtype ?? this.subtype,
    caption: caption ?? this.caption,
    copyright: copyright ?? this.copyright,
  );

  factory Multimedia.fromRawJson(String str) =>
      Multimedia.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"],
    format: json["format"],
    height: json["height"],
    width: json["width"],
    type: json["type"],
    subtype: json["subtype"],
    caption: json["caption"],
    copyright: json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "format": format,
    "height": height,
    "width": width,
    "type": type,
    "subtype": subtype,
    "caption": caption,
    "copyright": copyright,
  };
}

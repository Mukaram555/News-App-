// To parse this JSON data, do
//
//     final newsModelArt = newsModelArtFromJson(jsonString);

import 'dart:convert';

NewsModelArt newsModelArtFromJson(String str) =>
    NewsModelArt.fromJson(json.decode(str));

String newsModelArtToJson(NewsModelArt data) => json.encode(data.toJson());

class NewsModelArt {
  final String status;
  final String copyright;
  final String section;
  final DateTime lastUpdated;
  final int numResults;
  final List<Result> results;

  NewsModelArt({
    required this.status,
    required this.copyright,
    required this.section,
    required this.lastUpdated,
    required this.numResults,
    required this.results,
  });

  factory NewsModelArt.fromJson(Map<String, dynamic> json) => NewsModelArt(
    status: json["status"],
    copyright: json["copyright"],
    section: json["section"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    numResults: json["num_results"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "section": section,
    "last_updated": lastUpdated.toIso8601String(),
    "num_results": numResults,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  final String section;
  final String subsection;
  final String title;
  final String resultAbstract;
  final String url;
  final String uri;
  final String byline;
  final ItemType itemType;
  final DateTime updatedDate;
  final DateTime createdDate;
  final DateTime publishedDate;
  final String materialTypeFacet;
  final Kicker kicker;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Multimedia> multimedia;
  final String shortUrl;

  Result({
    required this.section,
    required this.subsection,
    required this.title,
    required this.resultAbstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.itemType,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    required this.kicker,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.multimedia,
    required this.shortUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    section: json["section"],
    subsection: json["subsection"],
    title: json["title"],
    resultAbstract: json["abstract"],
    url: json["url"],
    uri: json["uri"],
    byline: json["byline"],
    itemType: itemTypeValues.map[json["item_type"]]!,
    updatedDate: DateTime.parse(json["updated_date"]),
    createdDate: DateTime.parse(json["created_date"]),
    publishedDate: DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"],
    kicker: kickerValues.map[json["kicker"]]!,
    desFacet: List<String>.from(json["des_facet"].map((x) => x)),
    orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
    perFacet: List<String>.from(json["per_facet"].map((x) => x)),
    geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
    multimedia: List<Multimedia>.from(
      json["multimedia"].map((x) => Multimedia.fromJson(x)),
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
    "item_type": itemTypeValues.reverse[itemType],
    "updated_date": updatedDate.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
    "published_date": publishedDate.toIso8601String(),
    "material_type_facet": materialTypeFacet,
    "kicker": kickerValues.reverse[kicker],
    "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
    "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
    "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
    "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
    "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
    "short_url": shortUrl,
  };
}

enum ItemType { ARTICLE, INTERACTIVE }

final itemTypeValues = EnumValues({
  "Article": ItemType.ARTICLE,
  "Interactive": ItemType.INTERACTIVE,
});

enum Kicker {
  CRITIC_S_NOTEBOOK,
  CRITIC_S_PICK,
  EMPTY,
  HISTORIES_HAPPENINGS,
  LATE_NIGHT_ROUNDUP,
  MY_TEN,
}

final kickerValues = EnumValues({
  "Critic’s Notebook": Kicker.CRITIC_S_NOTEBOOK,
  "Critic’s Pick": Kicker.CRITIC_S_PICK,
  "": Kicker.EMPTY,
  "Histories & Happenings": Kicker.HISTORIES_HAPPENINGS,
  "Late Night ROUNDUP": Kicker.LATE_NIGHT_ROUNDUP,
  "my ten": Kicker.MY_TEN,
});

class Multimedia {
  final String url;
  final Format format;
  final int height;
  final int width;
  final Type type;
  final Subtype subtype;
  final String caption;
  final String copyright;

  Multimedia({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
    url: json["url"],
    format: formatValues.map[json["format"]]!,
    height: json["height"],
    width: json["width"],
    type: typeValues.map[json["type"]]!,
    subtype: subtypeValues.map[json["subtype"]]!,
    caption: json["caption"],
    copyright: json["copyright"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "format": formatValues.reverse[format],
    "height": height,
    "width": width,
    "type": typeValues.reverse[type],
    "subtype": subtypeValues.reverse[subtype],
    "caption": caption,
    "copyright": copyright,
  };
}

enum Format { LARGE_THUMBNAIL, SUPER_JUMBO, THREE_BY_TWO_SMALL_AT2_X }

final formatValues = EnumValues({
  "Large Thumbnail": Format.LARGE_THUMBNAIL,
  "Super Jumbo": Format.SUPER_JUMBO,
  "threeByTwoSmallAt2X": Format.THREE_BY_TWO_SMALL_AT2_X,
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({"photo": Subtype.PHOTO});

enum Type { IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final newsModelScience = newsModelScienceFromJson(jsonString);

import 'dart:convert';

NewsModelScience newsModelScienceFromJson(String str) =>
    NewsModelScience.fromJson(json.decode(str));

String newsModelScienceToJson(NewsModelScience data) =>
    json.encode(data.toJson());

class NewsModelScience {
  final String status;
  final String copyright;
  final String section;
  final DateTime lastUpdated;
  final int numResults;
  final List<Result> results;

  NewsModelScience({
    required this.status,
    required this.copyright,
    required this.section,
    required this.lastUpdated,
    required this.numResults,
    required this.results,
  });

  factory NewsModelScience.fromJson(Map<String, dynamic> json) =>
      NewsModelScience(
        status: json["status"],
        copyright: json["copyright"],
        section: json["section"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        numResults: json["num_results"],
        results: List<Result>.from(
          json["results"].map((x) => Result.fromJson(x)),
        ),
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
  final Section section;
  final Subsection subsection;
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
    section: sectionValues.map[json["section"]]!,
    subsection: subsectionValues.map[json["subsection"]]!,
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
    "section": sectionValues.reverse[section],
    "subsection": subsectionValues.reverse[subsection],
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

enum ItemType { ARTICLE, EMBEDDED_INTERACTIVE }

final itemTypeValues = EnumValues({
  "Article": ItemType.ARTICLE,
  "EmbeddedInteractive": ItemType.EMBEDDED_INTERACTIVE,
});

enum Kicker { EMPTY, IDEAS, PET_THEORY, THE_NEW_OLD_AGE, TRILOBITES }

final kickerValues = EnumValues({
  "": Kicker.EMPTY,
  "Ideas": Kicker.IDEAS,
  "Pet Theory": Kicker.PET_THEORY,
  "the new old age": Kicker.THE_NEW_OLD_AGE,
  "Trilobites": Kicker.TRILOBITES,
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

enum Format {
  LARGE_THUMBNAIL,
  MEDIUM_THREE_BY_TWO440,
  SUPER_JUMBO,
  THREE_BY_TWO_SMALL_AT2_X,
}

final formatValues = EnumValues({
  "Large Thumbnail": Format.LARGE_THUMBNAIL,
  "mediumThreeByTwo440": Format.MEDIUM_THREE_BY_TWO440,
  "Super Jumbo": Format.SUPER_JUMBO,
  "threeByTwoSmallAt2X": Format.THREE_BY_TWO_SMALL_AT2_X,
});

enum Subtype { PHOTO }

final subtypeValues = EnumValues({"photo": Subtype.PHOTO});

enum Type { IMAGE }

final typeValues = EnumValues({"image": Type.IMAGE});

enum Section { ADMIN, CLIMATE, HEALTH, SCIENCE, WORLD }

final sectionValues = EnumValues({
  "admin": Section.ADMIN,
  "climate": Section.CLIMATE,
  "health": Section.HEALTH,
  "science": Section.SCIENCE,
  "world": Section.WORLD,
});

enum Subsection { EARTH, EMPTY, EUROPE }

final subsectionValues = EnumValues({
  "earth": Subsection.EARTH,
  "": Subsection.EMPTY,
  "europe": Subsection.EUROPE,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

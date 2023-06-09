// To parse this JSON data, do
//
//     final mapPlaces = mapPlacesFromJson(jsonString);

import 'dart:convert';

MapPlaces mapPlacesFromJson(String str) => MapPlaces.fromJson(json.decode(str));

String mapPlacesToJson(MapPlaces data) => json.encode(data.toJson());

class MapPlaces {
  List<dynamic> htmlAttributions;
  String nextPageToken;
  List<Result> results;
  String status;

  MapPlaces({
    required this.htmlAttributions,
    required this.nextPageToken,
    required this.results,
    required this.status,
  });

  factory MapPlaces.fromJson(Map<String, dynamic> json) => MapPlaces(
        htmlAttributions:
            List<dynamic>.from(json["html_attributions"].map((x) => x)),
        nextPageToken: json["next_page_token"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "next_page_token": nextPageToken,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
      };
}

class Result {
  Geometry geometry;
  String icon;
  IconBackgroundColor iconBackgroundColor;
  String iconMaskBaseUri;
  String name;
  List<Photo> photos;
  String placeId;
  String reference;
  Scope scope;
  List<String> types;
  String vicinity;
  BusinessStatus? businessStatus;
  OpeningHours? openingHours;
  PlusCode? plusCode;
  double? rating;
  int? userRatingsTotal;

  Result({
    required this.geometry,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconMaskBaseUri,
    required this.name,
    required this.photos,
    required this.placeId,
    required this.reference,
    required this.scope,
    required this.types,
    required this.vicinity,
    this.businessStatus,
    this.openingHours,
    this.plusCode,
    this.rating,
    this.userRatingsTotal,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        geometry: Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        iconBackgroundColor:
            iconBackgroundColorValues.map[json["icon_background_color"]]!,
        iconMaskBaseUri: json["icon_mask_base_uri"],
        name: json["name"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        reference: json["reference"],
        scope: scopeValues.map[json["scope"]]!,
        types: List<String>.from(json["types"].map((x) => x)),
        vicinity: json["vicinity"],
        businessStatus: businessStatusValues.map[json["business_status"]]!,
        openingHours: json["opening_hours"] == null
            ? null
            : OpeningHours.fromJson(json["opening_hours"]),
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        rating: json["rating"]?.toDouble(),
        userRatingsTotal: json["user_ratings_total"],
      );

  Map<String, dynamic> toJson() => {
        "geometry": geometry.toJson(),
        "icon": icon,
        "icon_background_color":
            iconBackgroundColorValues.reverse[iconBackgroundColor],
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "place_id": placeId,
        "reference": reference,
        "scope": scopeValues.reverse[scope],
        "types": List<dynamic>.from(types.map((x) => x)),
        "vicinity": vicinity,
        "business_status": businessStatusValues.reverse[businessStatus],
        "opening_hours": openingHours?.toJson(),
        "plus_code": plusCode?.toJson(),
        "rating": rating,
        "user_ratings_total": userRatingsTotal,
      };
}

enum BusinessStatus { OPERATIONAL }

final businessStatusValues =
    EnumValues({"OPERATIONAL": BusinessStatus.OPERATIONAL});

class Geometry {
  Location location;
  Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        viewport: Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "viewport": viewport.toJson(),
      };
}

class Location {
  double lat;
  double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  Location northeast;
  Location southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

enum IconBackgroundColor { THE_7_B9_EB0, THE_909_CE1 }

final iconBackgroundColorValues = EnumValues({
  "#7B9EB0": IconBackgroundColor.THE_7_B9_EB0,
  "#909CE1": IconBackgroundColor.THE_909_CE1
});

class OpeningHours {
  bool openNow;

  OpeningHours({
    required this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };
}

class Photo {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}

enum Scope { GOOGLE }

final scopeValues = EnumValues({"GOOGLE": Scope.GOOGLE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

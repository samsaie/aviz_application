import '../../../../Constants/string_constants.dart';

class Promotion {
  String id;
  String title;
  String description;
  String thumbnailUrl;
  int price;
  int pricePerMeter;
  int meterage;
  int rooms;
  int floors;
  int buildYear;
  String sanad;
  String direction;

  String moreInfo;

  Promotion(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnailUrl,
      required this.price,
      required this.pricePerMeter,
      required this.meterage,
      required this.rooms,
      required this.floors,
      required this.buildYear,
      required this.sanad,
      required this.direction,
      required this.moreInfo});

  factory Promotion.fromJson(Map<String, dynamic> jsonObject) {
    return Promotion(
      id: jsonObject['id'],
      title: jsonObject['name'],
      description: jsonObject['description'],
      thumbnailUrl:
          '${StringConstants.baseUrl}files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      price: jsonObject['price'],
      pricePerMeter: jsonObject['pricePerMeter'],
      meterage: jsonObject['metraj'],
      rooms: jsonObject['room'],
      floors: jsonObject['floor'],
      buildYear: jsonObject['buildyear'],
      sanad: jsonObject['sanad'],
      direction: jsonObject['direction'],
      moreInfo: jsonObject['moreInfo'],
    );
  }
}

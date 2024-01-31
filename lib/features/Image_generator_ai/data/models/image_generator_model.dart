

class ImageGeneratorModel {
  int created;
  List<Datum> data;

  ImageGeneratorModel({
    required this.created,
    required this.data,
  });

  factory ImageGeneratorModel.fromJson(Map<String, dynamic> json) => ImageGeneratorModel(
    created: json["created"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );


}

class Datum {
  String url;

  Datum({
    required this.url,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    url: json["url"],
  );

}

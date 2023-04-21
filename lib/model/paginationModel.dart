// To parse this JSON data, do
//
//     final paginationModel = paginationModelFromJson(jsonString);

import 'dart:convert';

List<PaginationModel> paginationModelFromJson(String str) => List<PaginationModel>.from(json.decode(str).map((x) => PaginationModel.fromJson(x)));

String paginationModelToJson(List<PaginationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaginationModel {
  PaginationModel({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  String toString() {
    return 'PaginationModel{id: $id, name: $name, description: $description}';
  }

  int id;
  String name;
  String description;

  factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

class BoilVolume {
  BoilVolume({
    required this.value,
    required this.unit,
  });

  double value;
  Unit unit;

  factory BoilVolume.fromJson(Map<String, dynamic> json) => BoilVolume(
    value: json["value"]?.toDouble(),
    unit: unitValues.map[json["unit"]]!,
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "unit": unitValues.reverse[unit],
  };
}

enum Unit { LITRES, GRAMS, KILOGRAMS, CELSIUS }

final unitValues = EnumValues({
  "celsius": Unit.CELSIUS,
  "grams": Unit.GRAMS,
  "kilograms": Unit.KILOGRAMS,
  "litres": Unit.LITRES
});

enum ContributedBy { SAM_MASON_SAMJBMASON, ALI_SKINNER_ALI_SKINNER }

final contributedByValues = EnumValues({
  "Ali Skinner <AliSkinner>": ContributedBy.ALI_SKINNER_ALI_SKINNER,
  "Sam Mason <samjbmason>": ContributedBy.SAM_MASON_SAMJBMASON
});

class Ingredients {
  Ingredients({
    required this.malt,
    required this.yeast,
  });

  List<Malt> malt;
  String yeast;

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
    malt: List<Malt>.from(json["malt"].map((x) => Malt.fromJson(x))),
    yeast: json["yeast"],
  );

  Map<String, dynamic> toJson() => {
    "malt": List<dynamic>.from(malt.map((x) => x.toJson())),
    "yeast": yeast,
  };
}


enum Add { START, MIDDLE, END, DRY_HOP }

final addValues = EnumValues({
  "dry hop": Add.DRY_HOP,
  "end": Add.END,
  "middle": Add.MIDDLE,
  "start": Add.START
});

enum Attribute { BITTER, FLAVOUR, AROMA }

final attributeValues = EnumValues({
  "aroma": Attribute.AROMA,
  "bitter": Attribute.BITTER,
  "flavour": Attribute.FLAVOUR
});

class Malt {
  Malt({
    required this.name,
    required this.amount,
  });

  String name;
  BoilVolume amount;

  factory Malt.fromJson(Map<String, dynamic> json) => Malt(
    name: json["name"],
    amount: BoilVolume.fromJson(json["amount"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount.toJson(),
  };
}

class Method {
  Method({
    required this.mashTemp,
    required this.fermentation,
    this.twist,
  });

  List<MashTemp> mashTemp;
  Fermentation fermentation;
  String? twist;

  factory Method.fromJson(Map<String, dynamic> json) => Method(
    mashTemp: List<MashTemp>.from(json["mash_temp"].map((x) => MashTemp.fromJson(x))),
    fermentation: Fermentation.fromJson(json["fermentation"]),
    twist: json["twist"],
  );

  Map<String, dynamic> toJson() => {
    "mash_temp": List<dynamic>.from(mashTemp.map((x) => x.toJson())),
    "fermentation": fermentation.toJson(),
    "twist": twist,
  };
}

class Fermentation {
  Fermentation({
    required this.temp,
  });

  BoilVolume temp;

  factory Fermentation.fromJson(Map<String, dynamic> json) => Fermentation(
    temp: BoilVolume.fromJson(json["temp"]),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp.toJson(),
  };
}

class MashTemp {
  MashTemp({
    required this.temp,
    this.duration,
  });

  BoilVolume temp;
  int? duration;

  factory MashTemp.fromJson(Map<String, dynamic> json) => MashTemp(
    temp: BoilVolume.fromJson(json["temp"]),
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp.toJson(),
    "duration": duration,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

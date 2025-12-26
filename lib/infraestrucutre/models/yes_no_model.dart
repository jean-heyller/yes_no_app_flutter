import 'package:yes_no_app/config/domain/entities/message.dart';

class YesNoModel {
  YesNoModel({required this.image, required this.answer, required this.forced});

  String image;
  String answer;
  bool forced;

  factory YesNoModel.fromJson(Map<dynamic, dynamic> json) => YesNoModel(
    image: json["image"],
    answer: json["answer"],
    forced: json["forced"],
  );

  Map<dynamic, dynamic> toJson() => {
    "image": image,
    "answer": answer,
    "forced": forced,
  };

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : answer == 'no' ? 'No' : answer,
    fromWho: FromWho.hers,
    imageUrl: image
  );
}

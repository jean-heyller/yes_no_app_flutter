import 'package:dio/dio.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/infraestrucutre/models/yes_no_model.dart';

class GetYesNoAnswert {
  final _dio = Dio();


  Future<Message> getAnswer() async {

    final response = await _dio.get('https://yes-no-wtf.vercel.app/api');

    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toMessageEntity();


  }
}
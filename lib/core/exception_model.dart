import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String statuseCode;

  final String statuseMassage;

  const ErrorModel({
    required this.statuseCode,
    required this.statuseMassage,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statuseCode: json['code'],
      statuseMassage: json['message'],
    );
  }
  List<Object?> get props => [
        statuseCode,
        statuseMassage,
      ];
}

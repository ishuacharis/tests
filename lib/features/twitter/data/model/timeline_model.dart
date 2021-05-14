import 'package:tests/features/twitter/domain/entities/timeline_entity.dart';

class TimeLineModel extends TimeLineEntity{
  final List<Data> data;

  TimeLineModel({ required this.data });


  factory TimeLineModel.fromJson(Map<String, dynamic> json) {
    return TimeLineModel(data: json["data"]);
  }

  List<Object?> get props => [data,];
}
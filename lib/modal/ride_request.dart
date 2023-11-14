import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

var uuid = const Uuid();

class RideRequest {
  final String id;
  final String creatorName;
  final String startingPoint;
  final String destination;
  final DateTime datetime;
  final int seatsAvailable;

  RideRequest({
    // required this.id,
    required this.creatorName,
    required this.startingPoint,
    required this.destination,
    required this.datetime,
    required this.seatsAvailable,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(datetime); //4 *
  }
}

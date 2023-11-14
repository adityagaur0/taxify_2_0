import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/ride_request.dart';

class AppModel extends ChangeNotifier {
  final List<RideRequest> _confirmedRequest = [
    RideRequest(
        // id: '1',
        creatorName: 'Aditya Kumar gaur',
        startingPoint: "Bennett University",
        destination: "Parichowk",
        datetime: DateTime(2023, 11, 14, 12, 0, 0),
        seatsAvailable: 2),
    RideRequest(
        // id: '2',
        creatorName: 'Vinay Singhania',
        startingPoint: "Bennett Univeristy",
        destination: "Botanical garden",
        datetime: DateTime(2023, 11, 14, 12, 0, 0),
        seatsAvailable: 2),
  ];

  List<RideRequest> get confirmedRequests => _confirmedRequest;

  void createRequest(RideRequest request) {
    _confirmedRequest.add(request);
    notifyListeners();
  }

  // Add more methods for handling confirmations, booking details, etc.
}

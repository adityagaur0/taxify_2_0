import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/ride_request.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({super.key, required this.request});
  final RideRequest request;
  //   String creatorName;
  // String startingPoint;
  // String destination;
  // int seatsAvailable;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${request.startingPoint}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'To:      ${request.destination}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                Text("Photo"),
                Spacer(),
                Text(
                  request.creatorName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

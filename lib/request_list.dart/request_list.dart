import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/app_modal.dart';
import 'package:taxify_2_0/modal/ride_request.dart';
import 'package:taxify_2_0/request_list.dart/request_item.dart';

class RequestList extends StatelessWidget {
  const RequestList({super.key, required this.appModel});
  final AppModel appModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appModel.confirmedRequests.length,

      itemBuilder: (ctx, index) => RequestItem(
        request: appModel.confirmedRequests[index],
      ),
      // Text(
      //   expenses[index].title,
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taxify_2_0/modal/app_modal.dart';
import 'package:taxify_2_0/modal/ride_request.dart';
import 'package:taxify_2_0/request_list.dart/request_list.dart';
import 'package:taxify_2_0/screens/c_create_request_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.appModel});
  final AppModel appModel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openaddExpenseOverlay() {
    //   6**************
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => CreateRequestScreen(appModel: widget.appModel));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text(
        "No request found. Start creating some!",
      ),
    );
    if (widget.appModel.confirmedRequests.isNotEmpty) {
      mainContent = RequestList(appModel: widget.appModel);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          // Button to create a new ride request
          IconButton(
            onPressed: _openaddExpenseOverlay, //7****
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display upcoming ride requests
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}

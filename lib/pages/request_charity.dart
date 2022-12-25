import 'package:eloes/constants/constant_variables.dart';
import 'package:flutter/material.dart';

class RequestCharity extends StatefulWidget {
  const RequestCharity({Key? key}) : super(key: key);

  @override
  State<RequestCharity> createState() => _RequestCharityState();
}

class _RequestCharityState extends State<RequestCharity> {
  final _formKey = GlobalKey<FormState>();
  late double width;
  late double height;

  String error = '';
  String charityName = '';
  String website = '';
  String summary = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Charity' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: () {
                // show search
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: applicationBackgroundColor,
      body: Center(),
    );
  }
}

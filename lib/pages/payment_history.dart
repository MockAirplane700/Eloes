import 'package:eloes/constants/constant_variables.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment history' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: () {
                //show search
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: applicationBackgroundColor,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),),
    );
  }
}

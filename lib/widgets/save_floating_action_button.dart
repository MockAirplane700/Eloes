import 'dart:math';

import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/logic/charities.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/sql_object.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  final Charity charity;
  const CustomFloatingActionButton({Key? key , required this.charity}) : super(key: key);

  @override
  State<CustomFloatingActionButton> createState() => _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton> {
  final _key = GlobalKey<FormState>();
  double amount = 0.0;
  String error = '';

  @override
  Widget build(BuildContext context) {
    Charity charity = widget.charity;

    return FloatingActionButton(
        onPressed: (){
          //save to charities , ask how much they wish to donate a month to them
          showDialog(context: context, builder: (context) => AlertDialog(
            title: const Text('Add Charity to donation list' , style: TextStyle(color: textColor),),
            backgroundColor: dialogBoxColor,
            content: Form(
              key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // How much would you like to donate a month?
                    TextFormField(
                      decoration: const  InputDecoration(hintText: 'How much would you like to donate a month?'),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Value cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          amount = double.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                    // Submit button
                   Row(
                     children: [
                       Expanded(child: ElevatedButton(
                           onPressed: () {
                             // Save data accordingly
                             if (_key.currentState!.validate()){
                               Navigator.pop(context);
                               // save to sql here. 
                               Charities.addCharity(SqlObject(
                                   id: DateTime.now().millisecondsSinceEpoch, donation: amount.toString(), charity: charity), context);
                             }
                           },
                           child: const Text('Save' , style: TextStyle(color: textColor),)
                       ))
                     ],
                   ),
                    // Error message
                    Text(error , style: const TextStyle(color: Colors.red),)
                  ],
                )
            ),
          ));
        },
      elevation: 8,
      child: const Icon(Icons.add),
    );
  }
}

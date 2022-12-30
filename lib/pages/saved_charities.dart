import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/logic/charities.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/pages/view_charity.dart';
import 'package:eloes/widgets/custom_search_delegate_charities.dart';
import 'package:eloes/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;

class SavedCharities extends StatefulWidget {
  const SavedCharities({Key? key}) : super(key: key);

  @override
  State<SavedCharities> createState() => _SavedCharitiesState();
}

class _SavedCharitiesState extends State<SavedCharities> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    Future<void> initPaymentSheet() async {
     try {
       // 1. create payment intent on the server
       final data = await _createTestPaymentSheet();

       // 2. initialize the payment sheet
       await stripe.Stripe.instance.initPaymentSheet(
           paymentSheetParameters: stripe.SetupPaymentSheetParameters(
             //Enable custom flow
             customFlow: true,
             // Main params
             merchantDisplayName: 'Eloes',
             paymentIntentClientSecret: data['paymentIntent'],
             // Customer keys
             customerEphemeralKeySecret: data['ephemeralKey'],
             customerId: data['customer'],
             // extra options

           )
       );
     }catch (error) {
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Error $error'))
       );
       rethrow;
     }//end try-catch
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved charities' , style: TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: (){
                // show search
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: applicationBackgroundColor,
      drawer: const CustomDrawer(),
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // List view of saved charities
              SizedBox(
                width: width,
                height: height/1.5,
                child: FutureBuilder(
                    builder: (context , snapshot) {
                      if (snapshot.hasData) {
                        List savedCharities = snapshot.data as List;
                        if (savedCharities.isNotEmpty) {
                          return ListView.builder(
                            itemBuilder: (context , index) {
                              if (savedCharities.isEmpty) {
                                return const Center(child: Text('They are currently no saved charities', style: TextStyle(color: textColor),),);
                              } else {

                                return Card(
                                  shadowColor: shadowColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                  elevation: 8,
                                  child: ListTile(
                                    leading: Image.network(savedCharities[index].charity.logo),
                                    title: Text(savedCharities[index].charity.name , style: const TextStyle(color: textColor),),
                                    subtitle: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text('CAD\$${savedCharities[index].donation}0',style: const TextStyle(color: textColor), ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(savedCharities[index].charity.description , maxLines: 3,overflow: TextOverflow.ellipsis, style: const TextStyle(color: textColor),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing:  IconButton(
                                        onPressed: () {
                                          Charities.deleteSavedCharity(savedCharities[index]);
                                          setState(() {

                                          });
                                        },
                                        icon: const Icon(Icons.delete, color: iconColor,)),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCharity(charity: savedCharities[index].charity)));
                                    },
                                  ),
                                );
                              }//end if-else
                            },
                            itemCount: savedCharities.length,
                          );
                        }else{
                          return const Center(child: Text('They are currently no saved charities'),);
                        }//end if-else
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }//end if-else
                    },
                  future: Charities.getSavedSQLCharities(),
                )
              ),
              const Divider(),
              // Calculate and display total
              FutureBuilder(
                builder: (context , snapshot) {
                  double donation = 0.0;

                  if (snapshot.hasData) {
                    List list = snapshot.data;

                    for (var element in list) {
                      donation += double.parse(element.donation);
                    }//end for loop

                    String serviceFees = (donation * serviceFeePercentage).toStringAsFixed(2);
                    String taxes = (donation * taxPercentage).toStringAsFixed(2);
                    String finalTotal = ( (donation * serviceFeePercentage) + (donation * taxPercentage) + donation ).toStringAsFixed(2);
                    if (list.isNotEmpty) {
                      // total is zero
                      return Center(child: Padding(
                        padding: EdgeInsets.all(height/80),
                        child: Column(
                          children: [
                            //donation total
                            Row(
                              children:  [
                                const Expanded(flex: 2, child: Text('Donation total: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$${donation.toStringAsFixed(2)}', style: const TextStyle(color: textColor)))

                              ],
                            ),
                            //service fees
                            Row(
                              children: [
                               const  Expanded(flex: 2, child: Text('Service fees: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$$serviceFees', style: const TextStyle(color: textColor)))

                              ],
                            ),
                            // tax
                            Row(
                              children:  [
                                const Expanded(flex: 2, child: Text('Taxes: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$$taxes', style: const TextStyle(color: textColor)))

                              ],
                            ),
                            //final total
                            Row(
                              children:  [
                                const Expanded(flex: 2, child: Text('Final total: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$$finalTotal', style: const TextStyle(color: textColor)))

                              ],
                            ),
                          ],
                        ),
                      ),);
                    }else{
                      //total is not zero
                      return Center(child: Padding(
                        padding: EdgeInsets.all(height/80),
                        child: Column(
                          children: [
                            //donation total
                            Row(
                              children: const [
                                Expanded(flex: 2, child: Text('Donation total: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$0.00', style: TextStyle(color: textColor)))

                              ],
                            ),
                            //service fees
                            Row(
                              children: const [
                                Expanded(flex: 2, child: Text('Service fees: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$0.00', style: TextStyle(color: textColor)))

                              ],
                            ),
                            // tax
                            Row(
                              children: const [
                                Expanded(flex: 2, child: Text('Taxes: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$0.00', style: TextStyle(color: textColor)))

                              ],
                            ),
                            //final total
                            Row(
                              children: const [
                                Expanded(flex: 2, child: Text('Final total: ', style: TextStyle(color: textColor))),
                                Expanded(child: Text('CAD\$0.00', style: TextStyle(color: textColor)))

                              ],
                            ),
                          ],
                        ),
                      ),);
                    }//end if else
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }//end if-else
                },
                future: Charities.getSavedSQLCharities(),),
              // pay now button
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){
                    // todo: Use stripe to do payment , remember to check for success or failure
                    showDialog(context: context, builder: (context)=> const AlertDialog(
                      content: Text('To donate please send the amount total to the following email, via paypal,\nsizibamthandazo.@yahoo.com. \nA payment gateway will be in place in a future update'),
                    ));
                  }, child: const Text('Donate now')))
                ],
              )
            ],
          ),
        ),
      ),),
    );
  }

  _createTestPaymentSheet() {}
}

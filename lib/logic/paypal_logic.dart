import 'dart:convert';
import 'package:eloes/constants/constant_functions.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Paypal {
  void callPaypal(String total) async{

    String postBody =  "<!DOCTYPE html>"
        "<html lang=\"en\">"
        "<head>"
        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />"
        "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"
        "<title>PayPal Standard Payments Integration | Client Demo</title>"
        "</head>"

        "<body>"
        "<div id=\"paypal-button-container\"></div>"
        "<!-- Sample PayPal credentials (client-id) are included -->"
        "<script src=\"https://www.paypal.com/sdk/js?client-id=test&currency=USD&intent=capture&enable-funding=venmo\" data-sdk-integration-source=\"integrationbuilder\"></script>"
        "<script>"
        "const paypalButtonsComponent = paypal.Buttons({"
// optional styling for buttons
// https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
        "style: {"
        "color: \"gold\","
        "shape: \"rect\","
        "layout: \"vertical\""
        "},"

    // set up the transaction
        "createOrder: (data, actions) => {"
// pass in any options from the v2 orders create call:
// https://developer.paypal.com/api/orders/v2/#orders-create-request-body
        "const createOrderPayload = {"
        "purchase_units: ["
        "{"
        "amount: {"
        "value: $total"

        "}}]};"

        "return actions.order.create(createOrderPayload);"
        "},"

        "// finalize the transaction"
        "onApprove: (data, actions) => {"
        "const captureOrderHandler = (details) => {"
        "const payerName = details.payer.name.given_name;"
        "console.log('Transaction completed');"
        "};"

        "return actions.order.capture().then(captureOrderHandler);"
        "},"

        "// handle unrecoverable errors"
        "onError: (err) => {"
        "console.error('An error prevented the buyer from checking out with PayPal');"
        "}"
        "});"

        "paypalButtonsComponent"
        ".render(\"#paypal-button-container\")"
        ".catch((err) => {"
        "console.error('PayPal Buttons failed to render');"
        "});"
        "</script>"
        "</body>"
        "</html>";
    // post request form to upload code

    try {
      var response = await createFormRequest(postBody);
      if (response.statusCode == 200) {
        launchWebSiteUrl('https://sizibamthandazo-personal-server-g27um.ondigitalocean.app/paypal');
      }else{
        // an error of some sort occurred
      }//end if-else
    }catch (error) {
      throw Exception(error);
    }

//       // get local file path
//     final dir = await getApplicationDocumentsDirectory();
//     try {
//
//       // create a new html file with the amount and items above
//       File file = await File('${dir.path}/temp_payment_file.html').create(recursive: true);
//       await file.writeAsString(
//           "<!DOCTYPE html>"
//               "<html lang=\"en\">"
//               "<head>"
//               "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />"
//               "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />"
//               "<title>PayPal Standard Payments Integration | Client Demo</title>"
//               "</head>"
//
//               "<body>"
//               "<div id=\"paypal-button-container\"></div>"
//               "<!-- Sample PayPal credentials (client-id) are included -->"
//               "<script src=\"https://www.paypal.com/sdk/js?client-id=test&currency=USD&intent=capture&enable-funding=venmo\" data-sdk-integration-source=\"integrationbuilder\"></script>"
//               "<script>"
//               "const paypalButtonsComponent = paypal.Buttons({"
// // optional styling for buttons
// // https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
//               "style: {"
//               "color: \"gold\","
//               "shape: \"rect\","
//               "layout: \"vertical\""
//               "},"
//
//           // set up the transaction
//               "createOrder: (data, actions) => {"
// // pass in any options from the v2 orders create call:
// // https://developer.paypal.com/api/orders/v2/#orders-create-request-body
//               "const createOrderPayload = {"
//               "purchase_units: ["
//               "{"
//               "amount: {"
//               "value: $total"
//
//               "}}]};"
//
//               "return actions.order.create(createOrderPayload);"
//               "},"
//
//               "// finalize the transaction"
//               "onApprove: (data, actions) => {"
//               "const captureOrderHandler = (details) => {"
//               "const payerName = details.payer.name.given_name;"
//               "console.log('Transaction completed');"
//               "};"
//
//               "return actions.order.capture().then(captureOrderHandler);"
//               "},"
//
//               "// handle unrecoverable errors"
//               "onError: (err) => {"
//               "console.error('An error prevented the buyer from checking out with PayPal');"
//               "}"
//               "});"
//
//               "paypalButtonsComponent"
//               ".render(\"#paypal-button-container\")"
//               ".catch((err) => {"
//               "console.error('PayPal Buttons failed to render');"
//               "});"
//               "</script>"
//               "</body>"
//               "</html>"
//       );
//       // call url launcher on newly created html file
//       launchWebSiteUrl('https://sizibamthandazo-personal-server-g27um.ondigitalocean.app/paypal');
//       // delete the file after transaction is complete
//       await file.delete();
//     }catch (error) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ops, something went wrong.')));
//       throw Exception(error);
//     }


  }

  Future<http.Response> createFormRequest(String body) {
    return http.post(
      Uri.parse('https://sizibamthandazo-personal-server-g27um.ondigitalocean.app/api/paypal'),
      headers: <String,String>{
        'Content-type': 'application/json'
      },
      body: jsonEncode(<String,String>{
        'data' : body
      })
    );
  }
}
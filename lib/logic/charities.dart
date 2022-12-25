import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/sql_object.dart';
import 'package:eloes/persistence/sql_database.dart';
import 'package:flutter/material.dart';

class Charities{
  static List<Charity> charities = [];
  static List<SqlObject> savedCharities = [];

  static void setSearchList(List<Charity> list) {
    charities.clear();
    charities.addAll(list);
  }

  static List<Charity> getSampleCharities() {
    return charities;
  }//end get Sample charity

  static Future<dynamic> getSampleFuture() {
    return Future(() => print(''));
  }

  static List<Charity> getSavedCharities() {
    return [
      Charity(
          name: 'Some charity', description: 'Lorem Ipsum', country: 'Canada',
          logo: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Eleos.png?alt=media&token=79c859a6-3571-41b9-a6a2-a1cee03d3675', media: [
      ], youtube: 'https://www.youtube.com', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com', website: 'https://www.sizibamthandazo.dev',
          email: 'sizibamthandazo@yahoo.com', paypal: 'sizibamthandazo@yahoo.com', donation: '\$50.00'),
      Charity(
          name: 'Charity X', description: 'Lorem Ipsum', country: 'Canada',
          logo: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Eleos.png?alt=media&token=79c859a6-3571-41b9-a6a2-a1cee03d3675', media: [
      ], youtube: 'https://www.youtube.com', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com', website: 'https://www.sizibamthandazo.dev',
          email: 'sizibamthandazo@yahoo.com', paypal: 'sizibamthandazo@yahoo.com', donation: '\$50.00'),
      Charity(
          name: 'Some charity', description: 'Lorem Ipsum', country: 'Canada',
          logo: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Eleos.png?alt=media&token=79c859a6-3571-41b9-a6a2-a1cee03d3675', media: [
      ], youtube: 'https://www.youtube.com', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com', website: 'https://www.sizibamthandazo.dev',
          email: 'sizibamthandazo@yahoo.com', paypal: 'sizibamthandazo@yahoo.com', donation: '\$50.00'),
      Charity(
          name: 'Some Y', description: 'Lorem Ipsum', country: 'Canada',
          logo: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Eleos.png?alt=media&token=79c859a6-3571-41b9-a6a2-a1cee03d3675', media: [
      ], youtube: 'https://www.youtube.com', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com', website: 'https://www.sizibamthandazo.dev',
          email: 'sizibamthandazo@yahoo.com', paypal: 'sizibamthandazo@yahoo.com', donation: '\$50.00'),
      Charity(
          name: 'Some charity', description: 'Lorem Ipsum', country: 'Canada',
          logo: 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Eleos.png?alt=media&token=79c859a6-3571-41b9-a6a2-a1cee03d3675', media: [
      ], youtube: 'https://www.youtube.com', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com', website: 'https://www.sizibamthandazo.dev',
          email: 'sizibamthandazo@yahoo.com', paypal: 'sizibamthandazo@yahoo.com', donation: '\$50.00'),
    ];
  }

  static void setSqlObjectList(List<SqlObject> list) {
    list.clear();
    savedCharities.addAll(list);
  }

  static Future getSavedSQLCharities() async {
    return SqlDatabaseManager.getSavedCharities();
  }

  static Future deleteSavedCharity(SqlObject sqlObject) async {
    return await SqlDatabaseManager.deleteCharity(sqlObject);
  }

  static Future updateSavedCharity(SqlObject sqlObject) async {
    return SqlDatabaseManager.updateCharity(sqlObject);
  }

  static Future addCharity(SqlObject sqlObject, BuildContext context) async {
    bool boolean = true;

    for (var element in charities) {
      if (element.name.toLowerCase().contains(sqlObject.charity.name.toLowerCase())){
        boolean = false;
      }
    }

    if (boolean){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Thank you for donation! :) ')));
      return SqlDatabaseManager.insertCharity(sqlObject);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item already exists! :) ')));
      return null;
    }
  }
}//end charities
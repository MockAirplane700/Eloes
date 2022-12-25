import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/sql_object.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDatabaseManager{
  static late Database _database;

  // 'id' : id,
  // 'donation': donation,
  // 'charity_name':charity.name,
  // 'charity_description':charity.description,
  // 'charity_country':charity.country,
  // 'charity_image':charity.logo,
  // 'charity_media':charity.media,
  // 'charity_youtube':charity.youtube,
  // 'charity_twitter':charity.twitter,
  // 'charity_instagram':charity.instagram,
  // 'charity_tiktok':charity.tiktok,
  // 'charity_website':charity.website,
  // 'charity_email':charity.email,
  // 'charity_paypal':charity.paypal,
  // 'charity_donation':charity.donation

  static Future openDb() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "savedCharities.ddb"),
      version: 1,
      onCreate: (Database db, int version) async{
        await db.execute(
          "CREATE TABLE charities("
              "id INTEGER PRIMARY KEY autoincrement,"
              "donation TEXT, charity_name TEXT, charity_description TEXT,"
              "charity_country TEXT, charity_image TEXT, charity_media TEXT,"
              "charity_youtube TEXT, charity_twitter TEXT, charity_instagram TEXT,"
              "charity_tiktok TEXT, charity_website TEXT, charity_email TEXT,"
              "charity_paypal TEXT, charity_donation TEXT"
              ")"
        );
      }
    );
    return _database;
  }//end open db

  static Future insertCharity(SqlObject sqlObject) async{
    await openDb();
    try {
      return await _database.insert('charities', sqlObject.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(error) {
      throw Exception(error.toString());
    }//end try-catch
  }//end insert charity

  static Future<void> deleteCharity(SqlObject sqlObject) async {
    await openDb();
    await _database.delete('charities', where: "id =?", whereArgs: [sqlObject.id]);
  }// end delete charity

  static Future<int> updateCharity(SqlObject sqlObject) async {
    await openDb();
    return await _database.update('charities', sqlObject.toJson(), where: "id =?" , whereArgs: [sqlObject.id]);
  }//end update charity
  
  // todo: a function to change a string to a list of strings
  static List<dynamic> getImages(String string) {
    List<String> list = string.split(',');
    String secondString = list[0];
    String thirdString = list[list.length];
    List<String> splitStringOne = secondString.split('[');
    list.insert(0, splitStringOne[1]);
    List<String> splitStringTwo = thirdString.split(']');
    list.insert(list.length, splitStringTwo[1]);
    return list;
  }

  static Future<List<SqlObject>> getSavedCharities() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('charities');

    return List.generate(maps.length, (index) {
      return SqlObject(
          id: maps[index]['id'], donation:maps[index]['donation'] ,
          charity: Charity(
              name: maps[index]['charity_name'], description: maps[index]['charity_description'],
              country: maps[index]['charity_country'],
              logo: maps[index]['charity_image'], media: [maps[index]['charity_media'],''], youtube: maps[index]['charity_youtube'],
              twitter: maps[index]['charity_twitter'], instagram: maps[index]['charity_instagram'], tiktok: maps[index]['charity_tiktok'],
              website: maps[index]['charity_website'], email: maps[index]['charity_email'], paypal: maps[index]['charity_paypal'],
              donation: maps[index]['charity_donation']));
    }).toList();
  }//end get saved charities

}//end class
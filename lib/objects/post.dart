import 'package:eloes/objects/charity.dart';

class Post {
  // title , portrait , banner , description , link ,
  final String title;
  final String portrait;
  final String banner;
  final String description;
  final String link;
  final Charity charity;

  Post({required this.title , required this.portrait, required this.banner, required this.description, required this.link, required this.charity});
}//end post
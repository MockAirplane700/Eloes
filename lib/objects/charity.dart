import 'package:eloes/objects/post.dart';

class Charity {
  // name , description , country , logo , [media] , youtube , twitter , instagram , tiktok , paypal, website, email
  final String name;
  final String description;
  final String country;
  final String logo;
  final List<dynamic> media;
  final String youtube;
  final String twitter;
  final String instagram;
  final String tiktok;
  final String website;
  final String email;
  final String paypal;
  final String donation;

  Charity({
    required this.name, required this.description , required this.country,
    required this.logo, required this.media, required this.youtube,
    required this.twitter, required this.instagram, required this.tiktok,
    required this.website, required this.email, required this.paypal, required this.donation,
});


}//end charity class
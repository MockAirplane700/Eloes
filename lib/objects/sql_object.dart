import 'package:eloes/objects/charity.dart';

class SqlObject {
  final int id;
  final String donation;
  final Charity charity;

  SqlObject({required this.id,required this.donation, required this.charity});

  // Charity charity = Charity(name: name, description: description,
  //     country: country, logo: logo, media: media, youtube: youtube,
  //     twitter: twitter, instagram: instagram, tiktok: tiktok, website: website,
  //     email: email, paypal: paypal, donation: donation)

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'donation': donation,
      'charity_name':charity.name,
      'charity_description':charity.description,
      'charity_country':charity.country,
      'charity_image':charity.logo,
      'charity_media':charity.media.toString(),
      'charity_youtube':charity.youtube,
      'charity_twitter':charity.twitter,
      'charity_instagram':charity.instagram,
      'charity_tiktok':charity.tiktok,
      'charity_website':charity.website,
      'charity_email':charity.email,
      'charity_paypal':charity.paypal,
      'charity_donation':charity.donation

    };
  }
}
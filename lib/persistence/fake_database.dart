import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/post.dart';

class FakeDatabase {
  static String url = 'https://firebasestorage.googleapis.com/v0/b/coupons-are-us.appspot.com/o/Chronos%20logo%20(2).png?alt=media&token=c276a95d-3279-424e-b900-5ff1243420b4';
  static List<Post> getPosts () {
    return [
      Post(
          title: 'Some post', portrait: url, banner: url,
          description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
          charity: Charity(
            name: 'Some charity', description: 'lorem ipsum', country: 'Canada',
            logo: url, media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
            instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
            website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
            paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
      ) ,
      Post(
          title: 'Some post', portrait: url, banner: url,
          description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
          charity: Charity(
            name: 'Some charity', description: 'lorem ipsum', country: 'Canada',
            logo: url, media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
            instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
            website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
            paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
      ) ,
      Post(
          title: 'Some post', portrait: url, banner: url,
          description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
          charity: Charity(
            name: 'Some charity ', description: 'lorem ipsum', country: 'Canada',
            logo: url, media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
            instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
            website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
            paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
      ) ,
    ];
  }
}
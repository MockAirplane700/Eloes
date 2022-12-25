import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/post.dart';

class Posts {
  static List<Post> posts = [
    Post(
        title: 'Some post', portrait: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', banner: 'https://www.insperity.com/wp-content/uploads/2015/08/8-ways-to-ensure-your-company-aligns-with-the-right-charities-640x302.png',
        description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
        charity: Charity(
            name: 'Some charity', description: 'lorem ipsum', country: 'Canada',
            logo: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
            instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
            website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
            paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
    ) ,
    Post(
        title: 'Some post', portrait: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', banner: 'https://www.insperity.com/wp-content/uploads/2015/08/8-ways-to-ensure-your-company-aligns-with-the-right-charities-640x302.png',
        description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
        charity: Charity(
          name: 'Some charity', description: 'lorem ipsum', country: 'Canada',
          logo: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
          website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
          paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
    ) ,
    Post(
        title: 'Some post', portrait: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', banner: 'https://www.insperity.com/wp-content/uploads/2015/08/8-ways-to-ensure-your-company-aligns-with-the-right-charities-640x302.png',
        description: 'lorem ipsum', link: 'https://www.sizibamthandazo.dev',
        charity: Charity(
          name: 'Some charity', description: 'lorem ipsum', country: 'Canada',
          logo: 'https://smartmoneymamas.com/wp-content/uploads/2017/11/World-Wildlife-Fund-300x298.jpg', media: [], youtube: 'https://www.youtube.ca', twitter: 'https://www.twitter.com',
          instagram: 'https://www.instagram.com', tiktok: 'https://www.tiktok.com',
          website: 'https://www.sizibamthandazo.dev', email:  'sizibamthandazo@yahoo.com',
          paypal: 'sizibamthandazo@yahoo.com', donation: '\$ 20.00',)
    )
  ];

  static List<Post> getSamplePosts() {
    return posts;
  }// end get sample posts

  static Future<dynamic> getSampleFuture() {
    Future<List<dynamic>> list = Future(() => []);
    return list;
  }
}//end posts
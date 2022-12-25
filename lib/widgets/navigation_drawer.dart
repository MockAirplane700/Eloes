import 'package:eloes/constants/constant_functions.dart';
import 'package:eloes/constants/constant_variables.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

///--------------------------------------
///       Circle avatar logo
///       Request a charity
///       Share the application with your friends
///       Follow us on instagram
///       Rate our application
///       Report a bug
///       Contact us
///       About
///       Sign out
/// -------------------------------------

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: drawerHeaderColor,
              ),
              child: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/100),child: CircleAvatar(
                radius: MediaQuery.of(context).size.width/4,
                backgroundColor: drawerHeaderColor,
                child: Padding(padding: EdgeInsets.all( MediaQuery.of(context).size.width/50), child: Image.network(logoUrl)),),
                // backgroundImage: NetworkImage(logoUrl, scale: MediaQuery.of(context).size.width),
              ),),
            // Request a charity
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.handHoldingHeart, color: iconColor,),
              title: const Text('Request a charity', style: TextStyle(color: textColor),),
              onTap: () {
                // send an email to us about charity
                //
                launchEmailIntent('sizibamthandazo@yahoo.com', 'Requesting Charity');
              },
            ),
            // Share the application
            ListTile(
              leading: const Icon(Icons.share, color: iconColor,),
              title: const Text('Share Eloes!', style: TextStyle(color: textColor),),
              onTap: () {
                //share the application
                Share.share(shareUrl);
              },
            ),
            // Follow us on our socials
            ListTile(
              leading: const Icon(Icons.contacts_rounded, color: iconColor,),
              title: const Text('Follow us on our socials!', style: TextStyle(color: textColor),),
              onTap: () {
                //open dialog to icon buttons to socials
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('Where we are currently are!.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.instagram.com/mockAirplane700');
                      }, icon:const  FaIcon(FontAwesomeIcons.instagram))) ,
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.youtube.com');
                      }, icon: const FaIcon(FontAwesomeIcons.youtube),))
                    ],
                  ),),
                ));
              },
            ),
            // Rate our application
            ListTile(
              leading: const Icon(Icons.rate_review_outlined, color: iconColor,),
              title: const Text('Rate Eloes', style: TextStyle(color: textColor),),
              onTap: () {
                //go to ratings page on store
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('Please select the platform you are currently on.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: IconButton(onPressed: () {
                        // link to store page
                        launchWebSiteUrl('https://www.apple.com');
                      }, icon:const  FaIcon(FontAwesomeIcons.appStoreIos))) ,
                      Expanded(child: IconButton(onPressed: () {
                        launchWebSiteUrl('https://www.googleplaystore.com');
                      }, icon: const FaIcon(FontAwesomeIcons.googlePlay),))
                    ],
                  ),),
                ));
              },
            ),
            // report a bug
            ListTile(
              leading: const Icon(Icons.bug_report_rounded, color: iconColor,),
              title: const Text('Report a bug', style: TextStyle(color: textColor),),
              onTap: () {
                //send email report
                launchEmailIntent('sizibamthandazo@yahoo.com', 'COUPONS ARE US BUG REPORT');
              },
            ),
            // contact us
            ListTile(
              leading: const Icon(Icons.email, color: iconColor,),
              title: const Text('Contact us', style: TextStyle(color: textColor),),
              onTap: () {
                //Email intent
                launchEmailIntent('sizibamthandzo@yahoo.com', 'COUPONS ARE US CUSTOMER REACHING OUT');
              },
            ),
            // About
            ListTile(
              leading: const Icon(Icons.info_outlined, color: iconColor,),
              title: const Text('About', style: TextStyle(color: textColor),),
              onTap: () {
                //go to ratings page on store
                showDialog(context: context, builder: (context)=> AlertDialog(
                  title: const Text('Please select the platform you are currently on.'),
                  backgroundColor: dialogBoxBackgroundColor,
                  content: Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.width/80), child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: Text('How the application works')),
                      const Expanded(child: Text('When payments will be taken.')),
                      // link to privacy policy and terms and conditions
                      Expanded(child: TextButton(
                          onPressed: () {},
                          child: const Text('Privacy policy')
                      ))
                    ],
                  ),),
                ));
              },
            ),
          ],
        )
    );
  }
}
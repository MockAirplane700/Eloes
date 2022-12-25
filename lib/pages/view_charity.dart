import 'package:eloes/constants/constant_functions.dart';
import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/post.dart';
import 'package:eloes/pages/view_post.dart';
import 'package:eloes/widgets/custom_search_delegate_charities.dart';
import 'package:eloes/widgets/save_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewCharity extends StatefulWidget {
  final Charity charity;
  const ViewCharity({Key? key , required this.charity}) : super(key: key);

  @override
  State<ViewCharity> createState() => _ViewCharityState();
}

class _ViewCharityState extends State<ViewCharity> {
  late double height;
  late double width;
  late List<dynamic> posts;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    posts = widget.charity.media;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.charity.name , style: const TextStyle(color: textColor),),
        backgroundColor: appBarColor,
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        actions: [
          IconButton(
              onPressed: () {
                // show search
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: applicationBackgroundColor,
      floatingActionButton: CustomFloatingActionButton(charity: widget.charity),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row -> Circle avatar , Column -> Name , email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.charity.logo ),
                  radius: height/7,
                  backgroundColor: applicationBackgroundColor,
                )) ,
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.charity.name , style: const TextStyle(color: textColor, fontSize: 20),),
                    const Divider(),
                    Text(widget.charity.email , style: const TextStyle(color: textColor, fontSize: 15),)
                  ],
                ))
              ],
            ),
            // Divider
            const Divider(),
            // Description
            Padding(padding: EdgeInsets.all(width/80) , child: Text(widget.charity.description , style: const TextStyle(color: textColor),),),
            // Divider
            const Divider(),
            // List tile social media -> [instagram , facebook, tiktok, youtube]
            //Instagram
            Card(
              color: cardBackgroundColor,
              elevation: 8,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.instagram,  color: iconColor,),
                title: const Text('Visit our Instagram!' , style: TextStyle(color: textColor),),
                trailing: const Icon(Icons.more_vert, color: iconColor,),
                onTap: () {
                  // open social network
                  launchWebSiteUrl(widget.charity.instagram);
                },

              ),
            ),
            const Divider(),
            //twitter
            Card(
              color: cardBackgroundColor,
              elevation: 8,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.twitter, color: iconColor,),
                title: const Text('Visit our twitter!' , style: TextStyle(color: textColor),),
                trailing: const Icon(Icons.more_vert, color: iconColor,),
                onTap: () {
                  // open social network
                  launchWebSiteUrl(widget.charity.twitter);
                },

              ),
            ),
            const Divider(),
            //youtube
            Card(
              color: cardBackgroundColor,
              elevation: 8,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.youtube, color: iconColor,),
                title: const Text('Visit our Youtube!' , style: TextStyle(color: textColor),),
                trailing: const Icon(Icons.more_vert, color: iconColor,),
                onTap: () {
                  // open social network
                  launchWebSiteUrl(widget.charity.youtube);
                },

              ),
            ),
            //website
            const Divider(),
            Card(
              color: cardBackgroundColor,
              elevation: 8,
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.globe, color: iconColor,),
                title: const Text('Visit our website!' , style: TextStyle(color: textColor),),
                trailing: const Icon(Icons.more_vert, color: iconColor,),
                onTap: () {
                  // open social network
                  launchWebSiteUrl(widget.charity.website);
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}

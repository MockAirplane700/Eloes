import 'package:eloes/constants/constant_functions.dart';
import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/objects/post.dart';
import 'package:eloes/pages/view_charity.dart';
import 'package:eloes/widgets/custom_search_delegate_charities.dart';
import 'package:eloes/widgets/save_floating_action_button.dart';
import 'package:flutter/material.dart';

class ViewPost extends StatefulWidget {
  final Post post;
  const ViewPost({Key? key ,  required this.post}) : super(key: key);

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title, style: const TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
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
      floatingActionButton: CustomFloatingActionButton(charity: widget.post.charity),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(height/80) , child: Image.network(widget.post.banner),) ,
            const Divider(),
            //Description
            Padding(padding: EdgeInsets.all(height/50) , child: Row(
              children: [
                Text('Description: \n${widget.post.description}' , style: const TextStyle(color: textColor),),
              ],
            ),),
            //link to charity event or post event
            Card(
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              elevation: 8,
              child: ListTile(
                leading: const Icon(Icons.webhook_sharp, color: iconColor,),
                title:Text('Learn more about ${widget.post.title}' ,  style: const TextStyle(color: textColor),),
                subtitle: Text(widget.post.link , style: const TextStyle(color: textColor),),
                onTap: () {
                  // go to website
                  launchWebSiteUrl(widget.post.link);
                },
              ),
            ),
            const Divider(),
            // link to charity page
            Card(
              shadowColor: shadowColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/50)),
              elevation: 8,
              child: ListTile(
                leading: const Icon(Icons.handshake_sharp, color: iconColor,),
                title: Text(widget.post.charity.name ,  style: const TextStyle(color: textColor),),
                subtitle: Text(widget.post.charity.country , style: const TextStyle(color: textColor),),
                onTap: () {
                  // go to charity
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCharity(charity: widget.post.charity)));
                },
              ),
            ),
          ],
        ),
      ),),
    );
  }
}

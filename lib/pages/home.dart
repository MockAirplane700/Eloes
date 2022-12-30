import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/logic/charities.dart';
import 'package:eloes/logic/posts.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/objects/post.dart';
import 'package:eloes/pages/view_post.dart';
import 'package:eloes/persistence/fake_database.dart';
import 'package:eloes/widgets/custom_search_delegate_charities.dart';
import 'package:eloes/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';



// Change home to have products that can be purchased and used to fund the application

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double width;
  late double height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home' , style: TextStyle(color: textColor),),
        iconTheme: const IconThemeData(color: iconThemeDataColor),
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: (){
                // show search
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search)
          )
        ],
      ),
      backgroundColor: applicationBackgroundColor,
      drawer: const CustomDrawer(),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(height/90) , child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              builder: (context , snapshot) {
                List<Post> posts = FakeDatabase.getPosts();
                return SizedBox(
                  height: height,
                  child: ListView.builder(
                      itemBuilder: (context , index ) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPost(post: posts[index])));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(posts[index].portrait), fit: BoxFit.cover )
                            ),
                            height: height/1.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                                  shadowColor: shadowColor,
                                  elevation: 8,
                                  color: cardBackgroundColor,
                                  child: Padding(padding: EdgeInsets.all(height/80) , child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(posts[index].title , style: const TextStyle(color: textColor , fontSize: 18),),
                                        ],
                                      ) ,
                                      Row(
                                        children: [
                                          Text(posts[index].description , maxLines: 5, overflow: TextOverflow.ellipsis , style: const TextStyle(color: textColor),),
                                        ],
                                      ),
                                    ],
                                  ),),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    itemCount: posts.length
                  ),
                );
              },
              future: Posts.getSampleFuture(),
            ),
          ),
          SizedBox(
            height: 1.00,
            child: FutureBuilder(builder: (context, snapshot) {
              Charities.setSearchList(Charities.getSavedCharities());
              if (snapshot.hasData){
                // List<Charity> list = snapshot.data as List<Charity>;
                // Charities.setSearchList(list);

                return const Center(child: Text(''),);
              }
              return const Center(child: Text(''),);
            }, future: Charities.getSampleFuture(),),
          )
        ],
      ),)),
    );
  }
}

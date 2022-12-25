import 'package:eloes/constants/constant_variables.dart';
import 'package:eloes/logic/charities.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/pages/view_charity.dart';
import 'package:eloes/widgets/custom_search_delegate_charities.dart';
import 'package:eloes/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class CharitiesPage extends StatefulWidget {
  const CharitiesPage({Key? key}) : super(key: key);

  @override
  State<CharitiesPage> createState() => _CharitiesPageState();
}

class _CharitiesPageState extends State<CharitiesPage> {
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Charities' , style: TextStyle(color: textColor),),
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
      drawer: const CustomDrawer(),
      body: SafeArea(child: FutureBuilder(
          builder: (context , snapshot) {
            List<Charity> charities = Charities.getSavedCharities();
            Charities.setSearchList(charities);
            return ListView.builder(
                itemBuilder: (context , index) {
                  return GestureDetector(
                    onTap: () {
                      // open the charity page
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewCharity(charity: charities[index])));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height/80)),
                      shadowColor: shadowColor,
                      color: cardBackgroundColor,
                      child: Row(
                        children: [
                          Expanded(child: Padding(padding: EdgeInsets.all(height/80) , child: Image.network(charities[index].logo),)) ,
                          Expanded(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(charities[index].name , style: const TextStyle(color: textColor),),
                                ],
                              ) ,
                              Row(
                                children: [
                                  Text(charities[index].description,maxLines: 5,overflow: TextOverflow.ellipsis , style: const TextStyle(color: textColor),),
                                ],
                              ) ,
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
              itemCount: charities.length,
            );
          },
        future: Charities.getSampleFuture(),
      )),
    );
  }
}

import 'package:eloes/logic/charities.dart';
import 'package:eloes/objects/charity.dart';
import 'package:eloes/pages/view_charity.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate{
  int indexValue = 0;
  final List<Charity> charities = Charities.charities;

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(onPressed: () {
      query = '';
    }, icon: const Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, ''),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => charities.isNotEmpty ? ListTile(
    leading: Image.network(charities[indexValue].logo),
    title: Text(charities[indexValue].name),
    subtitle: Text(charities[indexValue].description, maxLines: 2,),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=> ViewCharity(charity: charities[indexValue]))
      );
    },
  ) :
    ListTile(title: Center(child: Text('Could not find $query'),),);

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestions = charities.where((element) {
      final itemNameComparison = element.name.toLowerCase();
      final input = query.toLowerCase();
      return itemNameComparison.contains(input);
    }).toList();

    return ListView.builder(
        itemBuilder: (context, index) {
          if (suggestions.isNotEmpty) {
            return  ListTile(
              leading: Image.network(suggestions[index].logo),
              title: Text(suggestions[index].name),
              subtitle: Text(suggestions[index].description, maxLines: 2,),
              onTap: () {
                query = suggestions[index].name;
                indexValue = index;
                showResults(context);
              },
            );
          }else{
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Data not currently available please wait')
              ],
            ),);
          }
        },
      itemCount: suggestions.length,
    );
  }
  
}
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
  return[
    IconButton(onPressed: (){ query="";}, icon: Icon(Icons.close)),
   
  ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
    IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  
  }

  @override
  Widget buildResults(BuildContext context) {
       return Text('data');

  }

  @override
  Widget buildSuggestions(BuildContext context) {
   if(query==""){
    return Center( child: Container(  decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/search.png"))),));
   }else{
    return Text('data');
   }
  }



}
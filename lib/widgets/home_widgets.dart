import 'dart:convert';

import 'package:contactapp/modal/user_modal.dart';
import 'package:contactapp/provider/provider.dart';
import 'package:contactapp/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  Future getUsers() async {
final response = await http
.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

List<User> users = [];

if (response.statusCode==200) {
var jsons = jsonDecode(response.body);

for(var json in jsons) {
  User user = User.fromJson(json);
  users.add(user);
}
}else{
  throw Exception("Failed to load users");
}
return users;
  }
  @override
  Widget build(BuildContext context) {
     final myfav = Provider.of<FavoriteProvider>(context);
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 67, 95),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                height: 50,
                width: double.infinity,
                 padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                 child:   TextField(
                  onChanged: (value) {
                  },
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Color.fromARGB(255, 64, 2, 75)),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(35))),
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.search)
                  ),               
                 ),
              ),
              const SizedBox(height: 40),
              Container(
          height: 510,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
                  child: FutureBuilder(
                    future: getUsers(),
                    builder: (context, snapshot){
                      if (snapshot.hasData) {
return Expanded(
  child:   ListView.builder(
  shrinkWrap: true,
    itemCount: snapshot.data.length,
  
    itemBuilder: (BuildContext context, int index) {
  
      return Container(
  
  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  
  child: ListTile(
  selectedTileColor: const Color.fromARGB(255, 152, 212, 240),
    leading: leadImage("assets/images/Josh.png"),
  
    title: textInfo(snapshot.data[index].name,
  
       FontWeight.w400, Colors.black),
  
       subtitle: textInfo(snapshot.data[index].email,
  
       FontWeight.w400, Colors.black),
  
       trailing: ElevatedButton.icon(
  
        onPressed: () {
  
           myfav.addFavorite(index);
  
        },
  
        icon: const Icon(Icons.add),
  
         label: const Text("Add"))
  
  ),
  
      ) ;
  
    },
  
  ),
);
                      }else{
                        return loadingCircle();
                      }
                    }
                    )
                  )
            ],)
        )),
    );
  }
}
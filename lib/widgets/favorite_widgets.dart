import 'package:contactapp/modal/user_modal.dart';
import 'package:contactapp/provider/provider.dart';
import 'package:contactapp/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  @override
  Widget build(BuildContext context) {
     final myfav = Provider.of<FavoriteProvider>(context);
    return Consumer<FavoriteProvider>(builder: (context, index, child) {
      return ListView.builder(
        itemCount: index.favoriteUsers.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: leadImage("assets/images/Josh.png"),
            title: textInfo( "${myfav.favoriteUsers[i].name}",FontWeight.w400, Colors.black),
            subtitle: textInfo("${myfav.favoriteUsers[i].email}",
             FontWeight.w400, Colors.black),
             trailing: IconButton(
              onPressed: () {
                 Provider.of<FavoriteProvider>(context, listen: false)
                      .removeFavorite("${myfav.favoriteUsers[i].name}","${myfav.favoriteUsers[i].email}" );
              },
               icon: const Icon(Icons.cancel)),
          ) ;
        },
      );
    },);
  }
}
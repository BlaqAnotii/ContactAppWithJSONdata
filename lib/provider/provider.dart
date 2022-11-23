
import 'package:contactapp/modal/user_modal.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier{
  List favoriteUsers = [];
   List get favorites => favoriteUsers;

    addFavorite (String name, String email){
    favoriteUsers.add(User(name: name, email: email));
    notifyListeners();
    }

  removeFavorite (String name, String email){
    favoriteUsers.remove(User(name: name, email: email));
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier{
  List<int> favoriteUsers = [];
   get favorites => favoriteUsers;

    addFavorite (int index){
    favoriteUsers.add(index);
    notifyListeners();
    }

  removeFavorite (int index){
    favoriteUsers.remove(index);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

Container profileImage(String asset) {
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        image: DecorationImage(image: AssetImage(asset))),
  );
}


Container leadImage(String asset) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        image: DecorationImage(image: AssetImage(asset))),
  );
}

Text textInfo(String text, FontWeight fontWeight, Color color) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontFamily: "Poppins",
        fontWeight: fontWeight),
  );
}

Container loadingCircle() {
  return Container(
    clipBehavior: Clip.none,
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
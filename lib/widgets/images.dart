import 'package:flutter/material.dart';

///Projenin dosya ile ismi aynı olan png resimlerini barındırır.
enum Images {
  island1,
  island2,
  island3,
  island4,
}

extension ImagesExtension on Images {
  ///png resmin yolunu döndürür.
  String path() => "assets/images/$name.png";

  ///Resmi [Image.asset] ile sarmalanmış olarak döndürür.
  Widget toWidget({double height = 100, double width = 100}) {
    return Image.asset(path(), height: height, width: width);
  }
}

import 'package:flutter/material.dart';

class PageModel{
  String _pathImage;
  String _title;
  String _discreption;
  IconData _iconData;

  PageModel(this._pathImage, this._title, this._discreption, this._iconData);

  IconData get iconData => _iconData;

  String get discreption => _discreption;

  String get title => _title;

  String get pathImage => _pathImage;
}
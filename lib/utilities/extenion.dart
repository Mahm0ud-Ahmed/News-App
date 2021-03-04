import 'package:flutter/material.dart';

Widget connectionError() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Center(
      child: Text('Error in Network Connection !'),
    ),
  );
}

Widget loading() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget errorInData(Object error) {
  return Container(
    child: Center(
      child: Text(error.toString()),
    ),
  );
}

Widget noData() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Center(
      child: Text('Data Not Available Now !'),
    ),
  );
}

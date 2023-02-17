import 'package:flutter/material.dart';
import 'package:flutter_graphql_demo/const/string_const.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app.dart';

void main() async {
  await initHiveForFlutter();
  runApp(const MaterialApp(title: StringConst.appTitle, home: App()));
}



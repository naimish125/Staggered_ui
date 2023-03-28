import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/provider/Stgered_Provider.dart';
import 'Screen/view/Stgered_Screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => StScreen(),
        },
      ),
    ),
  );
}
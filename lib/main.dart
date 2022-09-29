import 'package:flutter/material.dart';
import 'package:laplace_analytics/view_model/data_provider.dart';
import 'package:provider/provider.dart';

import 'view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataProvider())
      ],
      child: MaterialApp(
        title: 'Laplace Analytics',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeView(title: 'Laplace Analytics'),
      ),
    );
  }
}
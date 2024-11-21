import 'package:flutter/material.dart';
import 'package:flutter_news_app/pages/tabs_page.dart';
import 'package:flutter_news_app/services/new_services.dart';
import 'package:flutter_news_app/services/new_services2.dart';
import 'package:flutter_news_app/services/new_services3.dart';
import 'package:flutter_news_app/theme/tema.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewServices() ),
        ChangeNotifierProvider(create: (_) => NewServices2() ),
        ChangeNotifierProvider(create: (_) => NewServices3() )      
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}


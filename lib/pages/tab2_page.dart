import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/new_services2.dart';
import 'package:flutter_news_app/widgets/lista_noticas2.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatefulWidget {
  const Tab2Page({super.key});

  @override
  State<Tab2Page> createState() => _Tab2PageState();
}

class _Tab2PageState extends State<Tab2Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {


  final headlines = Provider.of<NewServices2>(context).headlines2;

    return Scaffold(
      body: (headlines.length == 0)
      ? Center(child: CircularProgressIndicator(),)
      : ListaNoticias2(headlines)
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
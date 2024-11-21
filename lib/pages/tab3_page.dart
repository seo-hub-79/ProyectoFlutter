import 'package:flutter/material.dart';
import 'package:flutter_news_app/services/new_services3.dart';
import 'package:flutter_news_app/widgets/lista_noticias3.dart';

import 'package:provider/provider.dart';

class Tab3Page extends StatefulWidget {
  const Tab3Page({super.key});

  @override
  State<Tab3Page> createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {


  final headlines = Provider.of<NewServices3>(context).headlines3;

    return Scaffold(
      body: (headlines.length == 0)
      ? Center(child: CircularProgressIndicator(),)
      : ListaNoticias3(headlines)
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
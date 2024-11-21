import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_models.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a510cea4889c4fc69891bc50a8a516ac';

class NewServices with ChangeNotifier{

  List<Article> headlines = [];

  NewServices() {
    getTopHeadlines();
  }
  
  Future<void> getTopHeadlines() async {
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    try{
      final resp = await http.get(url);

      if (resp.statusCode == 200){
        final newResponse = welcomeFromJson (resp.body);
        headlines.addAll(newResponse.articles);
        notifyListeners();
      }
      else{
        debugPrint('Error al cargar las noticas ${resp.statusCode}');
      }


    } catch (e){
      debugPrint('Excepcion al cargar las noticias $e');
    }
  }

}
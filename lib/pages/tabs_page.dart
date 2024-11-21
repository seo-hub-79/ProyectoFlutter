import 'package:flutter/material.dart';
import 'package:flutter_news_app/pages/tab1_page.dart';
import 'package:flutter_news_app/pages/tab2_page.dart';
import 'package:flutter_news_app/pages/tab3_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Proyecto Flutter'), elevation: 10),
        body: _paginas(),
        bottomNavigationBar: _Navegacion(),
        
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) => navegacionModel.paginaActual = index,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.person), 
          label: 'Top'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.computer),
          label: 'TechCrunch'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Entertainment'
        ),
      ]
    );
  }
}

class _paginas extends StatelessWidget {
  const _paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
        Tab3Page()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {

  int  _paginaActual = 0;

  final PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  PageController get pageController => this._pageController;

  set paginaActual(int valor){
    this._paginaActual = valor;
    this._pageController.animateToPage(valor, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);

    notifyListeners();
  }
}
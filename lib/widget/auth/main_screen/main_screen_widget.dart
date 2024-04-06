import 'package:flutter/material.dart';
import 'package:themoviedb/news_widget/news_widget.dart';
import 'package:themoviedb/widget/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);


  @override
  State<MainScreenWidget> createState() => _mainScreenWidgetState();
}

class _mainScreenWidgetState extends State<MainScreenWidget> {
int _selectedTab = 0;


void onSelectetTab(int index) {
  if (_selectedTab == index) return;
  setState(() {
    _selectedTab = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'TMDB',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NewsWidget(),
          MovieList(),
          Text('Сериалы'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Новости',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Фильмы'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: 'Сериалы',)],
        onTap: onSelectetTab,));
        }
      
    
  }

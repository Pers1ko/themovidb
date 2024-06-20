import 'package:flutter/material.dart';
import 'package:themoviedb/domain/api%20client/data_provider/session_data_provider.dart';
import 'package:themoviedb/ui/widget/movie_list/movie_list_widget.dart';
import 'package:themoviedb/ui/widget/news_widget/news_widget.dart';
import 'package:themoviedb/ui/widget/tv_show/tv_show.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});


  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
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
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
          onPressed: () => SessionDataProvider().setSessionId(null), 
          icon: const Icon(Icons.search))],
        title: const Text(
        'TMDB',
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          NewsWidget(),
          MovieList(),
          TWShowListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
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

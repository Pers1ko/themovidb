import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id, 
    required this.imageName, 
    required this.title, 
    required this.time, 
    required this.description
    });
}

class MovieList extends StatefulWidget {

  MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.mortal,
      title: 'Смертельная битва',
      time: 'April 7, 2012',
      description: 'The first season of Mortal Kombat Legacy is a prequel to the original'),
    Movie(
      id: 2,
      imageName: AppImages.mortal,
      title: 'Прибытие',
      time: 'April 7, 2012',
      description: 'The first season of Mortal Kombat Legacy is a prequel to the original'),
    Movie(
      id: 3,
      imageName: AppImages.mortal,
      title: 'Назад в будущее',
      time: 'April 7, 2012',
      description: 'The first season of Mortal Kombat Legacy is a prequel to the original'),
    Movie(
      id: 4,
      imageName: AppImages.mortal,
      title: 'Назад в будущее 2',
      time: 'April 7, 2012',
      description: 'The first season of Mortal Kombat Legacy is a prequel to the original'),
    Movie(
      id: 5,
      imageName: AppImages.mortal,
      title: 'Дюна',
      time: 'April 7, 2012',
      description: 'The first season of Mortal Kombat Legacy is a prequel to the original'),
  ];

var _filteredMovies = <Movie>[];

final _searchController = TextEditingController();

void _searchMovies() {
  final query = _searchController.text;
  if (query.isNotEmpty) {
    _filteredMovies = _movies.where((Movie movie) {
      return movie.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
  } else {
    _filteredMovies = _movies;
  }
  setState(() {});
}

@override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2,),
                      )
                    ]
                    ),
                    clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(movie.time,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 20),
                            Text(movie.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      ],),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10
                    ),
                    onTap: () => _onMovieTap(index),
                  ),
                )
              ],
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            cursorColor: AppColors.mainDarkBlue,
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              labelStyle: TextStyle(color: AppColors.mainDarkBlue),
              
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainDarkBlue),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainDarkBlue),
                borderRadius: BorderRadius.circular(30),
              )
            ),
          ),
        ),
      ],
    );
  }
}
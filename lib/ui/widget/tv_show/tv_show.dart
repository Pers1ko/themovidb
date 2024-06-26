
import 'package:flutter/material.dart';
import 'package:themoviedb/ui/Theme/app_colors.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/resources/resources.dart';

class TVShow {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  TVShow({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class TWShowListWidget extends StatefulWidget {
  const TWShowListWidget({Key? key}) : super(key: key);

  @override
  _TWShowListWidgetState createState() => _TWShowListWidgetState();
}

class _TWShowListWidgetState extends State<TWShowListWidget> {
  final _movies = [
    TVShow(
      id: 1,
      imageName: AppImages.kin2018,
      title: 'Flash',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 2,
      imageName: AppImages.kin2018,
      title: 'Чудеса науки',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 3,
      imageName: AppImages.kin2018,
      title: 'Скользящие',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 4,
      imageName: AppImages.kin2018,
      title: 'Академия амбрелла',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 5,
      imageName: AppImages.kin2018,
      title: 'Ходячие мертвицы',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 6,
      imageName: AppImages.kin2018,
      title: 'Пищеблок',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 7,
      imageName: AppImages.kin2018,
      title: 'Вампиры средней полосы',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 8,
      imageName: AppImages.kin2018,
      title: 'Теория большого взрыва',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 9,
      imageName: AppImages.kin2018,
      title: 'Дество шелдона',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 10,
      imageName: AppImages.kin2018,
      title: 'Как я встретил вашу маму',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 11,
      imageName: AppImages.kin2018,
      title: 'Гравити фолз',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 12,
      imageName: AppImages.kin2018,
      title: 'Утинные истории',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 13,
      imageName: AppImages.kin2018,
      title: 'Джентельмены',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 14,
      imageName: AppImages.kin2018,
      title: 'Наследие юпитера',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 15,
      imageName: AppImages.kin2018,
      title: 'Друзья',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    TVShow(
      id: 16,
      imageName: AppImages.kin2018,
      title: 'Квантовый скачек',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
  ];

  var _filteredMovies = <TVShow>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((TVShow movie) {
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
      MainNavigationRoutesNames.movieDetails,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
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
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTap(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            cursorColor: AppColors.mainDarkBlue,
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              labelStyle: const TextStyle(color: AppColors.mainDarkBlue),
              
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.mainDarkBlue),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.mainDarkBlue),
                borderRadius: BorderRadius.circular(30),
              )
            ),
          ),
        ),
      ],
    );
  }
}
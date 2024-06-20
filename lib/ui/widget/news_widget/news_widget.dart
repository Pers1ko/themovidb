import 'package:flutter/material.dart';
import 'package:themoviedb/ui/Theme/app_colors.dart';
import 'package:themoviedb/ui/elements/radial_percent_widget.dart';
import 'package:themoviedb/resources/resources.dart';

 const List<String> list = <String>['Фильмы', 'Сериалы'];


class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: const [ Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What's Popular",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DropdownButtonExample(),
              ],
            ),
            ),
            SizedBox(height: 15,),
            NewsListWidget(),
            SizedBox(height: 15,),
            FreeToWatch(),
            NewsListWidget(),
        ],
      ),
      ],
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Цвет тени с прозрачностью
            spreadRadius: 1, // Распространение тени
            blurRadius: 2, // Размытие тени
            offset: const Offset(1, 1), // Смещение тени
          ),
        ],
        ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down,),
          elevation: 16,
          style: const TextStyle(color: Colors.black,
            fontSize: 20),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: Colors.white
                ),
                
                child: Text(value)),
            );
          }).toList(),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(23),
        ),
      ),
    );
  }
}


class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 280,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: 20,
            itemExtent: 150,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    DecoratedBox(
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
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 2 / 3,
                              child: Image(
                                image: AssetImage(AppImages.mortal),
                                height: 120,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mortal Combat',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'Feb 21, 2020',
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                      top: -8,
                      right: -13,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: RadialPercentWidget(
                          percent: 0.72,
                          lineColor: Color.fromARGB(255, 195, 255, 0),
                          freeColor: Color.fromARGB(150, 158, 158, 158),
                          lineWidth: 5,
                          fillColor: AppColors.mainDarkBlue,
                          child: Center(
                            child: Text(
                              '72%',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class FreeToWatch extends StatefulWidget {
  const FreeToWatch({super.key});

  @override
  State<FreeToWatch> createState() => _FreeToWatchState();
}

class _FreeToWatchState extends State<FreeToWatch> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Free to Watch",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButtonExample(),
            ],
          ),
          ),
          SizedBox(height: 15,),
    
      ],
      
        );
  }
}
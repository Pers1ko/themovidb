import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Series Cast',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              )
            ),
            SizedBox(
              height: 280,
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 20,
                  itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2,),
                      )
                    ]
                        ),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            children: [
                              Image(image: AssetImage(AppImages.actor)),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Michael B. Jordan',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight:  FontWeight.bold
                                    ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text('John Kelly',
                                    maxLines: 1,),
                                    SizedBox(height: 5,),
                                    Text('8 Episodes',
                                    maxLines: 1,),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ),
            ),
          ],
        ),);
  }
}
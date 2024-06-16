import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/elements/radial_percent_widget.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPostersWidget(),
        const Padding(
          padding: EdgeInsets.all(15),
          child: _MovieNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _overviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _descriptionWidget(),
        ),
        const SizedBox(height: 30),
        const _PeopleWidget(),
        
    ]);
  }

  Text _descriptionWidget() {
    return const Text('An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
        style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,));
  }

  Text _overviewWidget() {
    return const Text('Обзор',
        style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,)
              );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(image: AssetImage(AppImages.big2),),
        Positioned(
          top: 20,
          left: 10,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.malenkaya),
           width: 146.93,
           height: 195.4,
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(
      children: [
        TextSpan(text: 'Без жалости ',
        style: TextStyle(fontWeight: FontWeight.w600,
        fontSize: 18),
        ),
        TextSpan(text: ' (2021)',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        )),
      ]
    )
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {}, 
          child: const Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: RadialPercentWidget( 
                  percent: 0.72,
                  fillColor: AppColors.mainDarkBlue,
                  lineColor: Color.fromARGB(255, 0, 255, 8), 
                  freeColor: Color.fromARGB(146, 2, 255, 10),
                  lineWidth: 3,
                  child: Text('72',
                  style: TextStyle(color: Colors.white),),
              ),
              ),
              SizedBox(width: 10,),
              Text('User Score',
              style: TextStyle(color: Colors.white),),
        ],
      )),
      Container(
        width: 1, height: 15,
        color: Colors.grey,
      ),
      TextButton(onPressed: () {}, child:
          const Row(
            children: [
              Icon(Icons.play_arrow,
              color: Colors.white,),
              Text('Play Trailer',
              style: TextStyle(color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }
}


class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text('R 04/29/2021 (US) Adventure, Action, Thriller, War 1h 49m',
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,)
              ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget();

  @override
  Widget build(BuildContext context) {
    const nameStyle =  TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400);
    const jobTilteStyle = TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400);
    return const Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Column(
            children: [
              Text('Stefano Sollima',
              style: nameStyle,),
              Text('Director',
              style: jobTilteStyle,),
            ],
          ),
          Column(
            children: [
              Text('Will Staples',
              style: nameStyle,
              ),
              Text('Screenplay',
              style: jobTilteStyle,),
            ],
          )
        ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Stefano Sollima',
              style: nameStyle,),
              Text('Director',
              style: jobTilteStyle),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Will Staples',
              style: nameStyle,),
              Text('Screenplay',
              style: jobTilteStyle,),
            ],
          )
        ],
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemExtent: 666.9,
      itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
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
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1),
                    Text('Oтец прoдал дoчь дeшевле, чeм cвинью незнакомкe, нo пoнятия нe имeл, чтo oна станeт cамой кpacивой вeдьмой 🤯🤯🤯',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.normal)),
                    SizedBox(height: 5),
                    Text('10',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20),
              SizedBox(width: 1,),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(image: AssetImage(AppImages.kin2018),
                        ),
                  ]
                    )
              )
            ]
              ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tests/features/page_builder/data/models/slide_model.dart';

class SingleSlide extends StatelessWidget {
  final int index;
  const SingleSlide({required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.height * 0.28,
          height: MediaQuery.of(context).size.height * 0.28,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(slides[index].imgUrl),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(height: 40.0,),
        Text(slides[index].title, style:
        TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor),),
        SizedBox(height: 10.0,),
        Text(slides[index].description,textAlign: TextAlign.center,)
      ],
    );
  }
}

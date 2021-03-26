import 'package:flutter/material.dart';
import 'package:tests/features/page_builder/data/models/slide_model.dart';


class SlideDot extends StatelessWidget {
  final int currenPage;

  const SlideDot({required this.currenPage});

  @override
  Widget build(BuildContext context) {
    return  Container(
      //color: Colors.red,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 35.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i < slides.length; i++)
                  if(i == currenPage)
                    _sliderDot(context,isActive: true,)
                  else
                    _sliderDot(context,isActive: false,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _sliderDot(BuildContext ctx, {required bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: isActive ? Theme.of(ctx).primaryColor : Colors.grey
      ),
    );
  }
}

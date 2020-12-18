import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tests/features/page_builder/data/models/slide_model.dart';
import 'package:tests/features/page_builder/presentation/widgets/slide_dot.dart';
import 'package:tests/features/page_builder/presentation/widgets/slides_widget.dart';



class TopWidget extends StatefulWidget {
  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {

  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if(_currentPage < 2) {
        _currentPage++;
      } else{
        _currentPage = 0;
      }

      _controller.animateToPage(_currentPage, duration: Duration(microseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //color: Colors.blue,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SlidesWidget(controller: _controller, pageChanged: _onPageChange,),
            SlideDot(currenPage: _currentPage,)
          ],
        ),
      ),
    );
  }
}

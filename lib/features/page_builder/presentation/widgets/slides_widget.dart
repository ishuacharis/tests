import 'package:flutter/material.dart';
import 'package:tests/features/page_builder/data/models/slide_model.dart';
import 'package:tests/features/page_builder/presentation/widgets/slide_widget.dart';

class SlidesWidget extends StatelessWidget {
  final PageController controller;
  final Function(int i) pageChanged;

  const SlidesWidget({required this.controller, required this.pageChanged});


  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller,
        onPageChanged: pageChanged,
        scrollDirection: Axis.horizontal,
        itemCount: slides.length,
        itemBuilder: (context, index) => SingleSlide(index: index)
    );
  }
}

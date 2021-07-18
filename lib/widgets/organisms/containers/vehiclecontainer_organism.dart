import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehicleContainer extends StatelessWidget {
  final List<Widget>? items;
  final Function(int, CarouselPageChangedReason)? onChange;

  VehicleContainer({this.onChange, this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: items,
          options:CarouselOptions(
            height: 150.w,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: false,
            enableInfiniteScroll: false,
            onPageChanged: onChange
          ) 
        )
      ],
    );
  }
}

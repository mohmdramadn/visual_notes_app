import 'dart:math';
import 'package:flutter/material.dart';

// 1
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  late final double minHeight;
  late final double maxHeight;
  late final String title;

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.title,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  // 2
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/test_pic.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(7))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Id',
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.white
                              .withOpacity(titleOpacity(shrinkOffset)),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 22.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 37.0),
                    child: Text(
                      '22/3/2022',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  // 3
  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        title != oldDelegate.title;
  }
}

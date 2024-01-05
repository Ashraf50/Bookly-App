import 'package:book_app/core/widget/shimmer.dart';
import 'package:flutter/material.dart';

class FetchedLoading extends StatelessWidget {
  const FetchedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ShimmerLoading(width: 150, height: 170),
          );
        },
      ),
    );
  }
}

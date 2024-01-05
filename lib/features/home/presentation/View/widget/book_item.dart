import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imgUrl;
  const BookItem({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}

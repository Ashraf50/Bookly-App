import 'package:book_app/core/Utils/assets.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetData.logo,
            width: 100,
          ),
          IconButton(
            onPressed: () {
              Get.to(
                const SearchView(),
              );
            },
            icon: const Icon(Icons.search, size: 35),
          ),
        ],
      ),
    );
  }
}

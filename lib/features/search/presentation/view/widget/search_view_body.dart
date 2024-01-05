import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/core/widget/custom_textfield.dart';
import 'package:book_app/features/search/presentation/view/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          CustomTextfield(
            hintText: "search",
            obscureText: false,
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
            validator: (p0) {
              return null;
            },
            autovalidateMode: AutovalidateMode.disabled,
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Result",
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

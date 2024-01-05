import 'package:book_app/core/Utils/text_style.dart';
import 'package:book_app/features/home/data/model/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/View/widget/details_book_list_view.dart';
import 'package:book_app/features/home/presentation/View/widget/details_button_action.dart';
import 'package:book_app/features/home/presentation/View/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsViewBody extends StatelessWidget {
  final BookModel model;
  const DetailsViewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  model.volumeInfo.imageLinks?.thumbnail ?? ""),
                              fit: BoxFit.cover)),
                      // child: Image.network(
                      //   model.volumeInfo.imageLinks.thumbnail,
                      //   height: 250,
                      // ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      model.volumeInfo.title!,
                      style: Styles.textStyle30,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      model.volumeInfo.authors?[0] ?? "not found",
                      style: Styles.textStyle18.copyWith(
                        color: const Color(0xff707070),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingWidget(
                      avgRating: model.volumeInfo.averageRating ?? 0,
                      rating: model.volumeInfo.ratingsCount ?? 0,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DetailsButtonAction(
                      previewOnTap: () async {
                        Uri uri = Uri.parse(model.volumeInfo.previewLink!);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri);
                        }
                      },
                      downloadOnTap: () async{
                        Uri uri=Uri.parse(model.accessInfo!.webReaderLink!);
                        if (await canLaunchUrl(uri)) {
                          launchUrl(uri);
                        }
                      },
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You can also like",
                          style: Styles.textStyle18,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const DetailsBookListView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

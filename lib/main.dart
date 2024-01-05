import 'package:book_app/constant.dart';
import 'package:book_app/core/Utils/api_service.dart';
import 'package:book_app/core/widget/show_snack_bar.dart';
import 'package:book_app/features/Authentication/data/auth_bloc/auth_bloc.dart';
import 'package:book_app/features/Authentication/presentation/view/sign_in_view.dart';
import 'package:book_app/features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/view_model/book_search/book_search_cubit.dart';
import 'package:book_app/features/home/presentation/view_model/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_app/features/home/presentation/view_model/newest_book_cubit/newest_book_cubit.dart';
import 'package:book_app/features/home/presentation/view_model/similar_book_cubit/similar_book_cubit.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:book_app/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => NewestBookCubit(
            HomeRepoImpl(
              ApiService(Dio()),
            ),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            HomeRepoImpl(
              ApiService(Dio()),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => SimilarBookCubit(
            HomeRepoImpl(
              ApiService(Dio()),
            ),
          )..fetchSimilarBooks(),
        ),
        BlocProvider(
          create: (context) => BookSearchCubit(
            HomeRepoImpl(
              ApiService(Dio()),
            ),
          )..fetchBookSearch(""),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData.dark().textTheme,
            )),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 181, 180, 180),
              ));
            } else if (snapshot.hasError) {
              return showSnackBar(context, "Something went wrong");
            } else if (snapshot.hasData) {
              return const SplashView();
            } else {
              return const SignInView();
            }
          },
        ),
      ),
    );
  }
}

import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/function/bloc_observer.dart';
import 'package:bookly/core/utils/function/service_locator.dart';
import 'package:bookly/core/utils/routes.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_book.dart';
import 'package:bookly/features/home/ui/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/ui/manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(featuredBooksBox);
  await Hive.openBox<BookEntity>(newestBooksBox);
  Bloc.observer = MyBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(getIt<FetchFeaturedBooksUseCase>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBookCubit(getIt<FetchNewestBookUseCase>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,

        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}

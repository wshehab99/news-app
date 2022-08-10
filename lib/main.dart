import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/shared/constant.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InintialAppState()),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = context.read<AppCubit>();
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            theme: lightThem,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}

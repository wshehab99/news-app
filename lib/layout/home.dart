import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  addNews() {
    print("added");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(InintialAppState())..getBusiness(),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            AppCubit cubit = context.read<AppCubit>();
            return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currntIndex,
                items: cubit.items,
                onTap: (index) {
                  cubit.changeCurrentIndex(index);
                },
              ),
              body: cubit.screens[cubit.currntIndex],
            );
          },
        ));
  }
}

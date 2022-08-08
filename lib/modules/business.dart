import 'package:flutter/material.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/layout/widget/article_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InintialAppState())..getBusiness(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          AppCubit cubit = context.read<AppCubit>();
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ArticleItem(
                    article: cubit.business[index],
                  ),
              separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
              itemCount: cubit.business.length);
        },
      ),
    );
  }
}

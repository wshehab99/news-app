import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';
import '../layout/widget/article_item.dart';

class SprortsScreen extends StatelessWidget {
  const SprortsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InintialAppState())..getSports(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          AppCubit cubit = context.read<AppCubit>();
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ArticleItem(
                    article: cubit.sports[index],
                  ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.sports.length);
        },
      ),
    );
  }
}

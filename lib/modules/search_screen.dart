import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';
import '../layout/widget/article_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: BlocProvider(
        create: (context) => AppCubit(InintialAppState()),
        child: BlocBuilder<AppCubit, AppStates>(
          builder: (context, state) {
            AppCubit cubit = context.read<AppCubit>();
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        hintText: "Search about some thing",
                        labelText: 'Search',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: ((value) => cubit.search(value)),
                  ),
                ),
                (searchController.text.isEmpty)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: const Center(
                          child: Text("Try to search about some thing"),
                        ),
                      )
                    : (state is LoadingState)
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: const Center(
                                child: CircularProgressIndicator()))
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ArticleItem(
                                  article: cubit.searchedNews[index],
                                ),
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  ),
                                ),
                            itemCount: cubit.searchedNews.length),
              ]),
            );
          },
        ),
      ),
    );
  }
}

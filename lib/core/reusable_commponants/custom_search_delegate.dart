import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/view_model/cubit/football_news_cubit.dart';
import 'package:football_app/presentation/layouts/home/tabs/explore_tab/widgets/article_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      // لا يؤثر هذا على الثيم العام للبرنامج
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Theme.of(context)
              .colorScheme
              .onPrimary, // لون النص داخل حقل البحث
        ),
      ),
      // تخصيص الـ TextField نفسه هنا
      appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onPrimary)),
      scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary, // تغيير لون الخلفية
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // إزالة الحدود
        ),
        hintStyle: const TextStyle(
          color: Colors.grey, // لون النص التلميحي (Hint)
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(
            Icons.arrow_back,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
          BlocProvider.of<FootballNewsCubit>(context).getFotballNews();
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    BlocProvider.of<FootballNewsCubit>(context).searchNews(query);
    return Scaffold(
      body: BlocBuilder<FootballNewsCubit, FootballNewsState>(
        buildWhen: (previous, current) {
          if (current is SearchNewsErrorState ||
              current is SearchNewsSuccessState ||
              current is SearchNewsLoadingState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SearchNewsSuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  ArticleWidget(article: state.listOfArticles[index]),
              itemCount: state.listOfArticles.length,
            );
          }
          if (state is SearchNewsErrorState) {
            return Center(
                child: Text(
              state.error,
              style: Theme.of(context).textTheme.titleLarge,
            ));
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_app/data/datasource_contract/remote/newsfootball_datasource_contract.dart';
import 'package:football_app/data/datasource_contract/remote/search_news_datasource_contract.dart';
import 'package:football_app/data/models/news_model/Articles.dart';
import 'package:football_app/presentation/layouts/home/tabs/home_tab/widgets/carousel_news_widget.dart';
import 'package:injectable/injectable.dart';

part 'football_news_state.dart';

@injectable
class FootballNewsCubit extends Cubit<FootballNewsState> {
  @factoryMethod
  FootballNewsCubit(
      this.newsfootballDatasourceContract, this.searchNewsDatasourceContract)
      : super(FootballNewsInitial());

  NewsfootballDatasourceContract newsfootballDatasourceContract;
  List<Articles> cachedArticles = [];
  List<Widget> carouselSlider = [];
  int pageSize = 10;
  int currentPage = 1;
  getFotballNews() async {
    if (cachedArticles.isNotEmpty) {
      emit(FootballNewsSuccessState(cachedArticles));
      return;
    }
    emit(FootballNewsLoadingState());
    var result = await newsfootballDatasourceContract.getNewsFootball(
        pageSize: pageSize, page: currentPage);
    return result.fold(
      (articles) {
        cachedArticles = articles;
        for (var i = 0; i < articles.length; i++) {
          carouselSlider.add(CarouselNewsWidget(
            imageUrl: articles[i].urlToImage ?? "",
            title: articles[i].title,
            articleUrl: articles[i].url,
          ));
        }
        emit(FootballNewsSuccessState(articles));
      },
      (error) {
        emit(FootballNewsErrorState(error));
      },
    );
  }

  refreshFootballNews() async {
    cachedArticles.clear();
    currentPage = 1;
    await getFotballNews();
  }

  getMoreFootballNews() async {
    currentPage++;
    var result = await newsfootballDatasourceContract.getNewsFootball(
        page: currentPage, pageSize: pageSize);
    return result.fold(
      (articles) {
        cachedArticles.addAll(articles);
        emit(FootballNewsSuccessState(cachedArticles));
      },
      (error) {
        emit(FootballNewsErrorState(error));
      },
    );
  }

  SearchNewsDatasourceContract searchNewsDatasourceContract;
  int searchPageSize = 10;
  int searchCurrentPage = 1;
  searchNews(String textSearch) async {
    emit(SearchNewsLoadingState());
    var result = await searchNewsDatasourceContract.getNews(
        page: searchCurrentPage,
        pageSize: searchPageSize,
        textSearch: textSearch);
    return result.fold(
      (articles) {
        emit(SearchNewsSuccessState(articles));
      },
      (error) {
        emit(SearchNewsErrorState(error));
      },
    );
  }
}

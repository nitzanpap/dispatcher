import '../../api/news_api/news_api_model_functions.dart';
import '../../api/news_api/news_api_top_articles_response.dart';

Future<List<Article>?> getMockArticles() async {
  final response = newsApiTopHeadlinesResponseFromJson(
      await getDataFromJsonFile(
          'assets/mock_files/news_api_top_headlines_response_example.json'));
  return response.articles;
}

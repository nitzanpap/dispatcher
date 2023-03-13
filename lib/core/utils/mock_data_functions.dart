import '../services/news_api_services/news_api_model_functions.dart';
import '../models/news_api_models/article.dart';
import '../models/news_api_models/news_api_top_articles_response.dart';

Future<List<Article>?> getMockArticles() async {
  final response = NewsApiTopHeadlinesResponse.fromRawJson(
      await NewsApiModelFunctions.getDataFromJsonFile(
          'assets/mock_files/news_api_top_headlines_response_example.json'));
  return response.articles;
}

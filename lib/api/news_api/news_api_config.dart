abstract class NewsApiConfig {
  static const newsApiKey = String.fromEnvironment('newsApiKey');
  static const topHeadlinesUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$newsApiKey';
}

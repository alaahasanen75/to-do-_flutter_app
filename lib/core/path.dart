class AppConstant {
  static const String BaseUrl = 'https://api.themoviedb.org/3';
  static const String ApiKay = 'e50e46379b9a36973c9e392bde9593f7';
  static const String nowPlayingPath =
      '$BaseUrl/movie/now_playing?api_key=$ApiKay';

  static const String popularPath = '$BaseUrl/movie/popular?api_key=$ApiKay';
  static const String topRatePath = '$BaseUrl/movie/top_rated?api_key=$ApiKay';
  static String DetailsUrl(int movieId) =>
      'https://api.themoviedb.org/3/movie/$movieId?api_key=e50e46379b9a36973c9e392bde9593f7';
  static const String BaseUrlImg = 'https://image.tmdb.org/t/p/w500';

  static String UrlImg(String path) => '$BaseUrlImg$path';
  static String UrlRecomanded(int movieId) =>
      '$BaseUrl/movie/$movieId/recommendations?api_key=$ApiKay';
}

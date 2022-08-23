class AppConstants {
  static String apiKey = '3f9c1185c2ef88ad334dcb5db152ec6b';
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String baseImageUrl = 'https://image.tmdb.org/t/p/original';
  static String discoverMovie = '/discover/movie';
  static String upcomingMovie = '/movie/upcoming';
  static String nowPlaying = '/movie/now_playing';
  static String genre = '/genre/movie/list';
  static String similarMovie(int movieID) => '/movie/$movieID/similar';
  static String cast(int movieID) => '/movie/$movieID/credits';

  //keys
  static String splashKey = 'splash_key';
  static String discoverKey = 'discover_key';
  static String nowPlayingKey = 'now_playing_key';
  static String favoriteKey = 'favorite_key';
}

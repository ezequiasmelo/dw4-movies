import 'package:dw4_movies_app/models/genre_model.dart';

abstract class GenresService {
  Future<List<GenreModel>> getGenres();
}

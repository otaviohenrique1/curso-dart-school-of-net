import 'Geometria/FormasGeometrica.dart';

class CriaPdf {
  static String render(FormaGeometrica forma) {
    return 'A area da forma geometrica é ' + forma.area().toString();
  }
}

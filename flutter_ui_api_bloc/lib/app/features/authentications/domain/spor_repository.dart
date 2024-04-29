import 'models/spors.dart';

abstract class SporsRepository {
 Future<Spors> getSpors (String league);
}
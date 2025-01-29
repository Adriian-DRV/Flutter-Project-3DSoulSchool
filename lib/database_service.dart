import 'package:mongo_dart/mongo_dart.dart';

class DatabaseService {
  static const String _mongoUrl ='mongodb+srv://Adriian-DRV:Adrian4er2023@flutter.owich.mongodb.net/Flutter-App?retryWrites=true&w=majority&tlsAllowInvalidCertificates=true';

  static const String _collectionName = 'flutter';

  static late Db _db;
  static late DbCollection _collection;

  static Future<void> connect() async {
    try {
      _db = await Db.create(_mongoUrl);
      await _db.open();
      _collection = _db.collection(_collectionName);
      print("Conexión establecida con la base de datos");
    } catch (e) {
      print("Error al conectar a la base de datos: $e");
    }
  }

  static Future<void> savePasswd(String passwd) async{
    await _collection.insertOne({'contraseña': passwd});
  }
}

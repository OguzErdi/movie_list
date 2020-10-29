import 'package:movie_app/utils/configs/config_loader_service.dart';

class Configs{
  static final Configs _singleton = Configs._internal();
  ConfigLoaderService configLoaderService = ConfigLoaderService();

  factory Configs() {
    return _singleton;
  }

  Configs._internal();

  Future getOmdbEndPoint(){
    return configLoaderService.getValue("omdb_endpoint");
  }
}
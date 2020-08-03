
import '../enum_class.dart';

///your base_url
String mockApi =  "http://private-9936c.apiary-mock.com/";
String stagingApi =  "https://api.themoviedb.org/3/";
String productionApi = "https://private-4f4db-alacarteapiary.apiary-mock.com/";

APIState currentState = APIState.STAGING;

class Constant {
  static String appName = "Mao Trailer";

  ///Api
  static String baseUrl() {
    switch (currentState) {
      case APIState.MOCK:
        return mockApi;
      case APIState.STAGING:
        return stagingApi;
      case APIState.PRODUCTION:
        return productionApi;
    }
  }
}
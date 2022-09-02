abstract class BaseAPIServices {
  Future<dynamic> getGETApiResponse(String url);
  Future<dynamic> getPOSTApiResponse(String url, dynamic data);
}

/**
 * Abstract classes in Dart are classes that contain one or more abstract methods.
 *  Note: Abstract methods are those methods that don't have any implementation.
 *  It should also be noted that a class in Dart can be declared abstract 
 * using the "abstract" keyword followed by the class declaration.
 */

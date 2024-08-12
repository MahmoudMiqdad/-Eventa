class EndPoint{
  static String baseUrl = "http://127.0.0.1:8000/api/";
  static String User_register = "User_register";
  static String User_login = "User_login";

  static String Display_public_eventst(category_id) {
    return "Display_public_events/{$category_id}";
  }
}
class ApiKey{
   static String status = "Status";
    static String message = "Message";
     static String email = "email";
      static String password = "password";
       static String token = "token";
        static String id = "id";
        

}
class AppUrls {
<<<<<<< HEAD
  static const String baseUrl = "http://10.0.2.2:5173/fitboxing";
=======
  static const String baseUrl = "http://localhost:8080/fitboxing";
>>>>>>> 0d971ea886a46c4c8adca327e22306e9078b47e5
  
  // Authentication endpoints
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/auth/register";
  
  // Session endpoints
  static const String getSessions = "$baseUrl/sessions";
  static const String bookSession = "$baseUrl/sessions/book";
  
  // Results endpoints
  static const String getResults = "$baseUrl/results";
  
  // User endpoints
  static const String getUserProfile = "$baseUrl/users/profile";
  static const String updateUserProfile = "$baseUrl/users/update";
  static const String uploadProfileImage = "$baseUrl/users/upload-profile-image"; // New API for image upload

}

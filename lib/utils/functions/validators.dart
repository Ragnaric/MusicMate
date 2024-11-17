
/// Class that contains all the functions for validating form fields
class ValidationUtils {
  static String? validateEmail(String email) {
    // if email does not match regex
      // return 'Invalid email'
    // else return null
    return null;
  }

  static String? validatePassword(String password) {
    if (password.length < 8) {
      return 'Password must have at least 8 characters';
    }
    // if password does not match regex for special characters
    // if password does not match regex for uppercase letters
    // if password does not match regex for numbers
    else {
      return null;
    }
  }
}
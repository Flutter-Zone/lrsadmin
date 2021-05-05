Map<String, String> getFirebaseErrorMessage(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return {
        "title": "Email Already Exist",
        "message":
            "Email is already in use by another user. Please use another email",
      };
      break;
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return {
        "title": "Invalid Credentials",
        "message": "Email or password is incorrect",
      };
      break;
    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return {
        "title": "Account Not Found",
        "message": "No account associated with this email",
      };
      break;
    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return {
        "title": "Account Onhold",
        "message":
            "Your account is currently inactive. Kindly contact the administrator for help",
      };
      break;
    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return {
        "title": "Too Many Tries",
        "message":
            "You have reached the number of tries for loggin in. Please Try again later."
      };
      break;
    case "ERROR_OPERATION_NOT_ALLOWED":
    case "operation-not-allowed":
      return {
        "title": "Server Error",
        "message":
            "We are currently having issues with the server. Please try again later",
      };
      break;
    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return {
        "title": "Invalid Email",
        "message": "The emial given is invalid",
      };
      break;
    default:
      return {
        "title": "Ooops! Something went wrong",
        "message": "We don't know what happened. Please try again later"
      };
      break;
  }
}

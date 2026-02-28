class AppStrings {
  static RegExp passRegexp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.{8,}$)');
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String emailFieldCantBeEmpty = "Please enter your email";
  static const String passwordFieldCantBeEmpty = "Please enter your password";
  static const String checkNetworkConnection = "Check network connection";
  static const String enterThe8Character = "Please Enter The 8 character";
  static const String passwordNotMatch = "Passwords do not match";
  static const String selectYourProfileImage = "Select Your Profile Image";

  //================== Custom Controller String ===================//
  static const String item = "Item";

  ///========================== Onboarding Screen =====================//
  static const String skip = "Skip";
  static const String next = "Next";
  static const String alreadyHaveAnAccount = "Already have an account? ";
  static const String hostigo = "Hostigo";
  static const String simplifyYourPropertyManagement = "Simplify your property management.";
  static const String welcomeToHostigo = "Welcome to Hostigo";
  static const String welcomeToHostigoSubtitle = "List properties, manage bookings, and track services - all in one connected platform.";
  static const String stayInControlWithHostigo = "Stay in control with Hostigo";
  static const String stayInControlWithHostigoSubtitle = "Manage your properties, track tasks, and connect with your team wherever you go.";
  static const String selectYourRole = "Select Your Role";
  static const String chooseHowYoulluseHostigo = "Choose how you\'ll use Hostigo";
  static const String propertyOwner = "Property Owner";
  static const String propertyOwnerDes = "Manage your properties, bookings, and security staff.";
  static const String serviceProvider = "Service Provider";
  static const String serviceProviderDes = "View and complete tasks, and receive direct payments.";
  static const String guest = "Guest";
  static const String guestDes = "Explore properties, book stays, and chat with your host.";


  ///========================== Login Screen =====================//
  static const String loginDes = "Welcome back to effortless management.";
  static const String login = "Login";
  static const String emailAddress = "Email Address";
  static const String enterYourEmail = "Enter your email";
  static const String password = "Password";
  static const String enterYourPassword = "Enter your password";
  static const String forgotPassword = "Forgot Password?";
  static const String orContinueWith = "or continue with";
  static const String dontHaveAnAccount  = "Don\'t have an account? ";
  static const String register = " Register";

  ///========================== Register Screen =====================//
  static const String fullName = " Full Name";
  static const String enterYourFulName = "Enter your full name";
  static const String enterYourEmailOrPhone = "Enter your email or phone";
  static const String emailAddressPhoneNumber = "Email Address /Phone Number";
  static const String location = "Location";
  static const String newPassword = "New Password";
  static const String confirmPassword = "Confirm Password";
  static const String confirmNewPassword = "Confirm New Password";
  static const String updatePassword = "Update Password";
  static const String uploadPassNid = "Upload a Security Document (Passport, NID)";
  static const String signUp = "Sign Up";
  static const String signUpWith = "Sign up with";
  static const String continueAsGuest = "Continue as guest";
  static const String forgetPassword = "FORGET PASSWORD";
  static const String forgetPasswordDes = "Enter your registered email or phone number and we'll send you a link to reset your password.";
  static const String send="Send";
  static const String backToLogIn="Back to Log in";
  static const String verifyOtp="VERIFY OTP";
  static const String verifyOtpDes ="Enter the 4-digit code sent to your email or phone number.";
  static const String verify ="Verify";
  static const String newPass ="SET A NEW PASSWORD";
  static const String newPass2 ="New Password";
  static const String yourAccountIsReady = "Your account is ready";
  ///============================ Commom Auth =========================//
  static const String welcomeBack = "Welcome Back !";
  static const String pleaseEnterYourPersonalData =
      "Please Enter Your Personal Data";
  static const String email = "Email";
  static const String loading = "loading";

  ///============================ Property Owner =========================//
  static const String overview = "Here's your today's overview";
  static const String overviewDes = "Professional cleaning for short-term rentals with 5 years of experience. Specialized in Airbnb turnovers, linens, and deep cleaning.";
  static const String rememberMe = "Remember me";
  static const String serviceTypeTxt = "Service Type: ";
  static const String experienceTxt = "Experience: ";
  static const String servicesOffered = "Services Offered";
  static const String availability = "Availability";
  static const String liveLocation = "Track Live Location";
  static const String location2 = "Downtown Dhaka, Bangladesh";
  static const String verifyCode = "Verify Code";
  static const String bookNow = "Book Now";
  static const String scheduleProperty = "Schedule a service for your property";
  static const String deepCleaningService = "Deep Cleaning Service";
  static const String verified = "Verified by Hostigo";
  static const String selectProperty = "Select Property";
  static const String selectServiceType = "Select Service Type";
  static const String chooseProperty = "Choose a Property";
  static const String deepCleaning = "Deep Cleaning";
  static const String selectDate = "Select Date";
  static const String selectTime = "Select Time";
  static const String specialInstructions = "Special Instructions (optional)";
  static const String noteForProvider = "Add notes for your provider";
  static const String paymentSummary = "Payment Summary";
  static const String basePrice = "Base Price:";
  static const String estimatedDuration = "Estimated Duration:";
  static const String totalCost = "Total Cost:";
  static const String hi = "HI !";
  static const String cancel = "Cancel";
  static const String pleaseSelectHowYou =
      "Pleas select how you want to use this app";
  static const String professional = "Professional";
  static const String user = "User";
  static const String phoneNumber = "Phone Number";
  static const String reason = "Reason";
  static const String phoneNumberT = "Phone Number :";
  static const String enterYourPhone = "Enter Your Phone No";
  static const String iAgree = "I agree with terms of service and ";
  static const String iAgree1 = "I agree with ";
  static const String iAgree2 = "Terms ";
  static const String iAgree3 = "of Service and ";
  static const String privacyPolicy = "Privacy policy";
  static const String termsAndConditions = "Terms and Conditions";
  static const String singUp = "Sing Up";
  static const String singUpText = "SIGN UP";
  static const String singInText = "SIGN IN!";
  static const String haveAnyAccount = "Have any account?";
  static const String logIn = "Log in";
  static const String logOut = "Log Out";
  static const String deleteAccount = "Delete Account";
  static const String yesDelete = "YES,DELETE";
  static const String updatePasswordText = "UPDATE PASSWORD";
  static const String scan = "Order History";
  static const String enterCode = "Enter 4 Digits Code";
  static const String enterTheCodeTitle =
      "Enter the 6 digits code that you received on your email";
  static const String ididntFind = "I didn't find confirmation code,";
  static const String sendAgain = "Send Again";
  static const String confirm = "Confirm";
  static const String bookingConfirmed = "Booking Confirmed";
  static const String bookingConfirmedDes = "Your cleaning service with John\'s Cleaning has been scheduled for Oct 12, 3 PM.";
  static const String success = "Success";
  static const String provider = "Provider:";
  static const String total = "Total:";
  static const String returnHome = "Return to Home";
  static const String bookingDetails = "View Booking Details";
  static const String serviceBookingDetails = "Service Booking Details";


  static const String emailConfirmation = "Email Confirmation";
  static const String enterYourEmailForVerification =
      "Enter Your email for verification.";
  static const String sendVerificationCode = "Send Verification Code";
  static const String verifyCodeText = "Verify Code";
  static const String setNewPassword = "Set New Password";
  static const String resendConfirmationCode = "Resend Confirmation Code";
  static const String resetPassword = "Reset Password !";
  static const String welcome = "Welcome";
  static const String nextAppointment = "Next Appointment";
  static const String popularServices = "Popular services";
  static const String viewAll = "View all";
  static const String offers = "Offers";
  static const String oldPassword = "Old password";
  static const String changePassword = "Change password";
  static const String yourName = "Your Name";
  static const String yourFirstName = "Your First Name";
  static const String userName = "User Name";
  static const String yourLastName = "Your Last Name";
  static const String selectSpecialization = "Select specialization";

  ///========================== Nav Bar =====================//
  static const String home = "Home";
  static const String message = "Message";
  static const String profile = "Profile";
  static const String goodEvening = "Good Evening";
  static const String myProperties = "My Properties";
  static const String serciceBookings = "Sercice Bookings";
  static const String guestManagement = "Guest Management";
  static const String myEarning = "My Earning";
  static const String addProfile = "Add Profile";


}

// =======newly added ===============


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  // Method to set user details
  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    //if password match and store the name and emaile
    try {
      //check if the password and confirm password are the same
      if (password != confirmPassword) {
        //display the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and confirm password do not match"),
          ),
        );
      }

      //create the instance form shared pref
      SharedPreferences pref = await SharedPreferences.getInstance();
      //store the user details
      await pref.setString("userName", userName);
      await pref.setString("email", email);
      //display the success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User details stored successfully"),
        ),
      );
    } catch (err) {
      err.toString();
    }
  }

  //method to check if the user is logged in
  static Future<bool> checkUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("userName");
    return userName != null;
  }

  //user detailes get
  static Future<Map<String, String>> getUserDetailes() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("userName");
    String? email = pref.getString("email");
    return {"userName": userName!, "email": email!};
  }
}

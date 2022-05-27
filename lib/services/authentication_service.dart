import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/modules/authentication/models/user_model.dart';
import 'package:firebase_todo_app/utils/api_status.dart';
import 'package:firebase_todo_app/utils/app_strings.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService{

  final String  _usersCollection = 'user';

  Future<ApiResponse> loginUser() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: <String>['email'],
      );
      final GoogleSignInAccount? accounts = await _googleSignIn.signIn();
      if(accounts != null){
        GoogleSignInAuthentication? auth = await accounts.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken,
          idToken: auth.idToken,
        );
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        UserModel userModel = UserModel(
          userId: userCredential.user?.uid,
          email: userCredential.user?.email,
          phoneNumber: userCredential.user?.phoneNumber,
          name: userCredential.user?.displayName,
          photo: userCredential.user?.photoURL,
        );
        final data = await FirebaseFirestore.instance
            .collection(_usersCollection)
            .doc(userCredential.user?.uid)
            .set(userModel.toJson());
        return ApiResponse.success(userModel);
      }
      return ApiResponse.error(AppStrings.somethingWentWrong);
    } catch (error) {
      log('Error => $error');
      return ApiResponse.error(error.toString());
    }
  }
}
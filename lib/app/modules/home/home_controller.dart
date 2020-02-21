import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  @observable
  bool isLoading = false;

  @observable
  FirebaseUser currentUser;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> getUser() async {
    if (currentUser != null) return currentUser;
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      final AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(authCredential);
      final FirebaseUser user = authResult.user;
      return user;
    } catch (error) {
      print("Error - - - " + error.toString());
      return null;
    }
  }

  void singOut() {
    FirebaseAuth.instance.signOut();
    googleSignIn.signOut();
    currentUser = null;
  }
}

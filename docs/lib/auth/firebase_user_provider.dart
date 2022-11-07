import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JphacksFirebaseUser {
  JphacksFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

JphacksFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JphacksFirebaseUser> jphacksFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<JphacksFirebaseUser>(
      (user) {
        currentUser = JphacksFirebaseUser(user);
        return currentUser!;
      },
    );

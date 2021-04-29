import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GifShareFirebaseUser {
  GifShareFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

GifShareFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GifShareFirebaseUser> gifShareFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GifShareFirebaseUser>(
            (user) => currentUser = GifShareFirebaseUser(user));

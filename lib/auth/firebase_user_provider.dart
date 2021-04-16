import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'firebase_user_provider.freezed.dart';

@freezed
abstract class GifShareFirebaseUser implements _$GifShareFirebaseUser {
  factory GifShareFirebaseUser.user(User user) = _User;
  factory GifShareFirebaseUser.loggedOut() = _LoggedOut;
  factory GifShareFirebaseUser.initial() = _Initial;
}

bool loggedIn = false;

final gifShareFirebaseUser = FirebaseAuth.instance
    .userChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GifShareFirebaseUser>((user) {
  loggedIn = user != null;
  return user != null
      ? GifShareFirebaseUser.user(user)
      : GifShareFirebaseUser.loggedOut();
}).shareValueSeeded(GifShareFirebaseUser.initial());

GifShareFirebaseUser get currentUser => gifShareFirebaseUser.value;

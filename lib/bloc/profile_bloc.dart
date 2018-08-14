import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/profile_model.dart';
import 'package:rxdart/subjects.dart';

class ProfileBloc {
  Stream<Profile> get stream => _profileSubject.stream;
  final _profileSubject = new BehaviorSubject<Profile>();

  void getProfile(String profileId) {
    Firestore.instance
        .collection('profile')
        .document(profileId)
        .get()
        .then((profile) {
      _profileSubject.add(new Profile(
          name: profile.data['name'],
          job: profile.data['job'],
          company: profile.data['company'],
          cover: profile.data['cover'],
          photo: profile.data['photo']));
    });
  }
}

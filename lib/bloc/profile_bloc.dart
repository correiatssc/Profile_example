import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/profile_model.dart';
import 'package:rxdart/subjects.dart';

class ProfileBloc {
  final _getProfileSubject = StreamController<String>();
  Sink<String> get setProfileId => _getProfileSubject.sink;

  final _profileSubject = new BehaviorSubject<Profile>();
  Stream<Profile> get currentProfile => _profileSubject.stream;

  final _smallWinSubject = new BehaviorSubject<SmallWin>();
  Stream<SmallWin> get profileSmallWin => _smallWinSubject.stream;

  final _smallWinPhotosSubject = new BehaviorSubject<List<String>>();
  Stream<List<String>> get profileSmallWinPhotos =>
      _smallWinPhotosSubject.stream;

  ProfileBloc() {
    _getProfileSubject.stream.listen(_setProfileId);
  }

  void _setProfileId(String profileId) async {
    await getProfile(profileId).then((profile) {
      _profileSubject.add(profile);
    });

    getSmallWin(profileId).then((newSmallWin) {
      _smallWinSubject.add(newSmallWin);
    });

    getSmallWinPhotos(profileId).then((newSmallWinPhotos) {
      _smallWinPhotosSubject.add(newSmallWinPhotos);
    });
  }

  Future<Profile> getProfile(String profileId) async {
    Profile profileRecovered;
    await Firestore.instance
        .collection('profile')
        .document(profileId)
        .get()
        .then((profileSnapshot) {
      profileRecovered = new Profile(
          name: profileSnapshot.data['name'],
          job: profileSnapshot.data['job'],
          company: profileSnapshot.data['company'],
          cover: profileSnapshot.data['cover'],
          photo: profileSnapshot.data['photo']);
    });
    return profileRecovered;
  }

  Future<SmallWin> getSmallWin(String profileId) async {
    SmallWin smallWinRecovered;
    await Firestore.instance
        .collection('small_win_widget')
        .document(profileId)
        .get()
        .then((smallWinSnapshot) {
      smallWinRecovered = new SmallWin(title: smallWinSnapshot.data['title']);
    });
    return smallWinRecovered;
  }

  Future<List<String>> getSmallWinPhotos(String profileId) async {
    List<String> smallWinPhotosRecovered = new List<String>();
    await Firestore.instance
        .collection('small_win_widget')
        .document(profileId)
        .collection('photos')
        .getDocuments()
        .then((photosCollection) {
      photosCollection.documents.forEach(
          (snapshot) => smallWinPhotosRecovered.add(snapshot.data['photo']));
    });
    return smallWinPhotosRecovered;
  }
}

import 'package:rxdart/subjects.dart';

class UserBloc {
  final _userName = BehaviorSubject<String>();

  Stream<String> get userName => _userName.stream;
  Function(String) get updateUserName => _userName.sink.add;

  final _userEmotion = BehaviorSubject<String>();

  Stream<String> get userEmotion => _userEmotion.stream;
  Function(String) get updateUserEmotion => _userEmotion.sink.add;

  dispose() {
    _userName.close();
    _userEmotion.close();
  }
}

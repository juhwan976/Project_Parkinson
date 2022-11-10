import 'package:project_parkinson/model/enum.dart';
import 'package:rxdart/subjects.dart';

class UserBloc {
  final _userName = BehaviorSubject<String>();

  Stream<String> get userName => _userName.stream;
  Function(String) get updateUserName => _userName.sink.add;

  final _userEmotion = BehaviorSubject<EmotionType>();

  Stream<EmotionType> get userEmotion => _userEmotion.stream;
  Function(EmotionType) get updateUserEmotion => _userEmotion.sink.add;

  void dispose() {
    _userName.close();
    _userEmotion.close();
  }
}

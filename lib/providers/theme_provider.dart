import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // 다크 모드 상태 변수
  bool _isDarkMode = false;

  // 현재 테마를 반환하는 메서드
  ThemeData get currentTheme => _isDarkMode ? _darkTheme : _lightTheme;

  // 다크 모드 상태를 반환하는 메서드
  bool get isDarkMode => _isDarkMode;

  // 다크 모드 상태를 토글하는 메서드
  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    // 테마 변경을 알리기 위해 notifyListeners 호출
    notifyListeners();
  }

  // 어두운 테마
  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    // 여기에 어두운 테마의 커스텀 속성을 추가할 수 있습니다.
  );

  // 밝은 테마
  final ThemeData _lightTheme = ThemeData.light().copyWith(
    // 여기에 밝은 테마의 커스텀 속성을 추가할 수 있습니다.
  );
}

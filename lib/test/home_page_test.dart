import 'package:test/test.dart';
import 'package:projeto_app/home/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  test('changeBgColor() muda a cor de fundo', () {
    final homePage = _HomePageState();

    homePage.changeBgColor();
    expect(homePage.bgColor, equals(Colors.black));

    homePage.changeBgColor();
    expect(homePage.bgColor, equals(Colors.white));
  });
}

class _HomePageState {
  Color bgColor = Colors.white;

  void changeBgColor() {
    bgColor = bgColor == Colors.white ? Colors.black : Colors.white;
  }
}
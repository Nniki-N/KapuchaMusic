import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kapuha_music/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.addContact).existsSync(), true);
    expect(File(Svgs.add).existsSync(), true);
    expect(File(Svgs.arrowDown).existsSync(), true);
    expect(File(Svgs.arrowLeft).existsSync(), true);
    expect(File(Svgs.arrowNext).existsSync(), true);
    expect(File(Svgs.arrowRight).existsSync(), true);
    expect(File(Svgs.arrowUp).existsSync(), true);
    expect(File(Svgs.burgerMenu).existsSync(), true);
    expect(File(Svgs.chatMenu).existsSync(), true);
    expect(File(Svgs.chat).existsSync(), true);
    expect(File(Svgs.dotsMenu).existsSync(), true);
    expect(File(Svgs.favouriteFilled).existsSync(), true);
    expect(File(Svgs.favourite).existsSync(), true);
    expect(File(Svgs.homeMenu).existsSync(), true);
    expect(File(Svgs.magnifier).existsSync(), true);
    expect(File(Svgs.noteMenu).existsSync(), true);
    expect(File(Svgs.peopleMenu).existsSync(), true);
    expect(File(Svgs.playMessage).existsSync(), true);
    expect(File(Svgs.play).existsSync(), true);
    expect(File(Svgs.remove).existsSync(), true);
    expect(File(Svgs.startPageFirst).existsSync(), true);
    expect(File(Svgs.startPageSecond).existsSync(), true);
    expect(File(Svgs.startPageThird).existsSync(), true);
  });
}

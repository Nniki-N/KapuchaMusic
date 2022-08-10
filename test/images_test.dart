import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kapuha_music/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.avatar).existsSync(), true);
    expect(File(Images.img1).existsSync(), true);
    expect(File(Images.img2).existsSync(), true);
    expect(File(Images.img3).existsSync(), true);
    expect(File(Images.img4).existsSync(), true);
    expect(File(Images.img5).existsSync(), true);
    expect(File(Images.img6).existsSync(), true);
    expect(File(Images.img7).existsSync(), true);
    expect(File(Images.img8).existsSync(), true);
    expect(File(Images.user1).existsSync(), true);
    expect(File(Images.user2).existsSync(), true);
  });
}

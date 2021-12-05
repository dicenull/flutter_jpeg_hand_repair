import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as image;

final imageProvider =
    Provider.family.autoDispose<Uint8List, String>((ref, str) {
  var characterImg = image.Image(64, 64);

  image.fill(characterImg, image.getColor(255, 255, 255));

  image.drawStringCentered(characterImg, image.arial_48, str,
      color: image.getColor(0, 0, 0));

  return Uint8List.fromList(image.encodeJpg(characterImg));
});

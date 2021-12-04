import 'dart:typed_data';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/radio_button_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as image;

final imageProvider =
    Provider.family.autoDispose<Uint8List, String>((ref, str) {
  var characterImg = image.Image(48, 48);

  image.fill(characterImg, image.getColor(255, 255, 255));

  image.drawStringCentered(characterImg, image.arial_48, str,
      color: image.getColor(0, 0, 0));

  return Uint8List.fromList(image.encodeJpg(characterImg));
});

class RadioPage extends HookConsumerWidget {
  final buttonKeys = [UniqueKey(), UniqueKey(), UniqueKey()];
  final text = 'PASSWORD';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputs = () =>
        buttonKeys.map((e) => ref.read(radioValues(e).state).state).toList();

    useEffect(() {
      final controller = ref.read(jpegPasswordProvider.notifier);

      controller.generatePass(buttonKeys.length);
      return () {};
    }, []);

    useEffect(() {
      text.characters.forEach((t) {
        final controller = ref.read(jpegRepairProvider(t).notifier);
        Future.microtask(() {
          controller.glitch(ref.read(imageProvider(t)), inputs());
        });
      });

      return () {};
    }, [
      ...buttonKeys.map((e) => ref.watch(radioValues(e))),
    ]);

    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...text.characters.map(
                    (t) => Container(
                      width: 32,
                      height: 32,
                      child: ref
                          .watch(jpegRepairProvider(t).select((value) => value))
                          .when(
                            data: (image) {
                              return Image.memory(
                                image,
                                scale: 1.0,
                              );
                            },
                            loading: () => Container(
                              child: Icon(Icons.image),
                            ),
                            error: (obj, err) => Container(),
                          ),
                    ),
                  )
                ],
              ),
            ),
            ...buttonKeys.map((buttonKey) {
              return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: RadioButtonList(
                  key: buttonKey,
                  onChange: (value) async {
                    ref
                        .read(jpegPasswordProvider.notifier)
                        .checkPassword(inputs());
                  },
                ),
              );
            }),
            if (ref.watch(
                jpegPasswordProvider.select((value) => value.correctPassword)))
              Container(
                child: Text('正解！！！'),
              ),
          ],
        ),
      ),
    );
  }
}

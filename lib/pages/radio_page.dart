import 'dart:typed_data';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/radio_button_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as image;

final imageProvider = FutureProvider<Uint8List>((ref) async {
  var characterImg = image.Image(48, 48);

  image.fill(characterImg, image.getColor(255, 0, 0));

  image.drawStringCentered(characterImg, image.arial_48, 'A');

  return Uint8List.fromList(image.encodeJpg(characterImg));
});

class RadioPage extends HookConsumerWidget {
  final buttonKeys = [UniqueKey(), UniqueKey(), UniqueKey()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final controller = ref.read(jpegRepairProvider.notifier);

      controller.generatePass(buttonKeys.length);
      return () {};
    }, []);

    useEffect(() {
      final inputs =
          buttonKeys.map((e) => ref.read(radioValues(e).state).state).toList();

      final controller = ref.read(jpegRepairProvider.notifier);
      Future.microtask(() {
        ref.read(imageProvider).maybeWhen(
              data: (imageData) {
                controller.glitch(imageData, inputs);
              },
              orElse: () {},
            );
      });

      return () {};
    }, [
      ...buttonKeys.map((e) => ref.watch(radioValues(e))),
      ref.watch(imageProvider),
    ]);

    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            Container(
              width: 256,
              height: 256,
              child: ref
                  .watch(jpegRepairProvider.select((value) => value.image))
                  .when(
                data: (image) {
                  return Image.memory(
                    image,
                    scale: 1.0,
                  );
                },
                loading: () {
                  return Container();
                },
                error: (obj, err) {
                  return Container();
                },
              ),
            ),
            ...buttonKeys.map((buttonKey) {
              return RadioButtonList(
                key: buttonKey,
                onChange: (value) async {},
              );
            }),
            if (ref.watch(
                jpegRepairProvider.select((value) => value.correctPassword)))
              Container(
                child: Text('正解！！！'),
              ),
          ],
        ),
      ),
    );
  }
}

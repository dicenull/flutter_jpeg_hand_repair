import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/radio_button_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        final controller = ref.read(jpegRepairProvider.notifier);

        controller.generatePass();
        Future.microtask(() async {
          final imageData = await rootBundle.load('assets/images/dice.jpg');
          final pass = ref.read(radioValue);

          controller.glitch(Uint8List.view(imageData.buffer), [pass]);
        });

        return () {};
      },
      [],
    );

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
                    scale: .2,
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
            RadioButtonList(() async {
              final imageData = await rootBundle.load('assets/images/dice.jpg');
              final pass = ref.read(radioValue);

              ref
                  .read(jpegRepairProvider.notifier)
                  .glitch(Uint8List.view(imageData.buffer), [pass]);
            }),
            if (ref.watch(
                    jpegRepairProvider.select((value) => value.password)) ==
                ref.watch(radioValue))
              Container(
                child: Text('正解！！！'),
              ),
          ],
        ),
      ),
    );
  }
}

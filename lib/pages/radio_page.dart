import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/image_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/glitched_image_text.dart';
import 'package:flutter_jpeg_hand_repair/widgets/radio_button_list.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioPage extends HookConsumerWidget {
  final buttonKeys = [UniqueKey(), UniqueKey()];
  final maxPassNum = 5;
  final text = 'PASSWORD';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputs = () =>
        buttonKeys.map((e) => ref.read(radioValues(e).state).state).toList();

    useEffect(() {
      final controller = ref.read(jpegPasswordProvider.notifier);

      Future.microtask(
        () => controller.generatePass(buttonKeys.length, max: maxPassNum),
      );
      return () {};
    }, const []);

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
                    (t) => GlitchedImageText(t),
                  )
                ],
              ),
            ),
            ...buttonKeys.map((buttonKey) {
              return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: RadioButtonList(
                  max: maxPassNum,
                  key: buttonKey,
                  onChange: (value) async {
                    ref
                        .read(jpegPasswordProvider.notifier)
                        .checkPassword(inputs());
                  },
                ),
              );
            }),
            if (ref.watch(jpegPasswordProvider
                .select((value) => value.correctPassword))) ...[
              Container(
                padding: const EdgeInsets.all(16),
                child: Text('正解！！！'),
              ),
              NeumorphicButton(
                child: Text('次に行く'),
                onPressed: () {
                  GoRouter.of(context).go('/stages/slider');
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}

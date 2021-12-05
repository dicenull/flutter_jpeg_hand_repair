import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/image_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/glitched_image_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _checkProvider = StateProvider((_) => false);
final _inputProvider = Provider(
  (ref) => ref.watch(_checkProvider.select((v) => v)) ? 1 : 0,
);

class SwitchPage extends HookConsumerWidget {
  final _text = '!';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(_inputProvider, (previous, next) {
      ref.read(jpegPasswordProvider.notifier).checkPassword([next]);
    });

    useEffect(() {
      final controller = ref.read(jpegPasswordProvider.notifier);

      Future.microtask(() {
        ref.read(_checkProvider.notifier).state = false;
        controller.generatePass(1, max: 0);
      });
      return () {};
    }, const []);

    useEffect(() {
      _text.characters.forEach((t) {
        final controller = ref.read(jpegRepairProvider(t).notifier);
        Future.microtask(() {
          controller.glitch(
            ref.read(imageProvider(t)),
            [ref.read(_inputProvider)],
          );
        });
      });

      return () {};
    }, [ref.watch(_checkProvider.select((value) => value))]);

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
                  ..._text.characters.map(
                    (t) => GlitchedImageText(t),
                  )
                ],
              ),
            ),
            NeumorphicSwitch(
              value: ref.watch(_checkProvider.select((v) => v)),
              onChanged: (value) {
                ref.read(_checkProvider.notifier).state = value;
              },
            ),
            if (ref.watch(jpegPasswordProvider
                .select((value) => value.correctPassword))) ...[
              Container(
                padding: const EdgeInsets.all(16),
                child: Text('OK!'),
              ),
              NeumorphicButton(
                child: Text('次に行く'),
                onPressed: () {
                  GoRouter.of(context).go('/stages/radio');
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}

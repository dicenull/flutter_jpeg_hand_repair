import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/image_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/glitched_image_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart';

final _inputProvider = StateProvider((ref) => 0);

class SliderPage extends HookConsumerWidget {
  final _text = 'XYZ';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(_inputProvider, (previous, next) {
      ref.read(jpegPasswordProvider.notifier).checkPassword([next]);
    });

    useEffect(() {
      final controller = ref.read(jpegPasswordProvider.notifier);

      Future.microtask(() => controller.generatePass(1, max: 0));
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
    }, [ref.watch(_inputProvider.select((value) => value))]);

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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              constraints: BoxConstraints(maxWidth: 500),
              child: NeumorphicSlider(
                min: 0,
                max: 10,
                value: ref
                    .watch(_inputProvider.select((value) => value.toDouble())),
                onChanged: (value) {
                  ref.read(_inputProvider.notifier).state = value.round();
                },
              ),
            ),
            if (ref.watch(jpegPasswordProvider
                .select((value) => value.correctPassword))) ...[
              Container(
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

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/image_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_password_controller.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/glitched_image_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _sliderProviders = StateProvider.autoDispose.family((ref, _) => 0);

class SliderPage extends HookConsumerWidget {
  final sliderKeys = [UniqueKey(), UniqueKey(), UniqueKey()];
  final _text = 'HogeHugaPiyoPiyo';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputs = () => sliderKeys
        .map((e) => ref.read(_sliderProviders(e).state).state)
        .toList();

    useEffect(() {
      final controller = ref.read(jpegPasswordProvider.notifier);

      Future.microtask(() {
        controller.generatePass(sliderKeys.length);
      });
      return () {};
    }, const []);

    useEffect(() {
      _text.characters.forEach((t) {
        final controller = ref.read(jpegRepairProvider(t).notifier);
        Future.microtask(() {
          controller.glitch(
            ref.read(imageProvider(t)),
            inputs(),
          );
        });
      });

      return () {};
    }, [
      sliderKeys
          .map((e) => ref.watch(_sliderProviders(e).select((value) => value)))
    ]);

    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 8,
                spacing: 2,
                alignment: WrapAlignment.center,
                children: [
                  ..._text.characters.map(
                    (t) => GlitchedImageText(t),
                  )
                ],
              ),
            ),
            ...sliderKeys.map((sliderKey) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                constraints: BoxConstraints(maxWidth: 500),
                child: NeumorphicSlider(
                  min: 0,
                  max: 10,
                  value: ref.watch(_sliderProviders(sliderKey)
                      .select((value) => value.toDouble())),
                  onChanged: (value) {
                    ref.read(_sliderProviders(sliderKey).notifier).state =
                        value.round();
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
                child: Text('OK!'),
              ),
              NeumorphicButton(
                child: Text('トップに戻る'),
                onPressed: () {
                  GoRouter.of(context).go('/');
                },
              )
            ],
          ],
        ),
      ),
    );
  }
}
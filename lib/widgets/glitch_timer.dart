import 'dart:async';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/glitch_time_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _timeTextProvider = StateProvider((_) => AsyncValue<String>.loading());

class GlitchTimer extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        ref.read(_timeTextProvider.notifier).state = AsyncValue.data(
          ref
              .read(glitchTimerProvider)
              .elapsed
              .toString()
              .split('.')
              .first
              .padLeft(8, '0'),
        );
      });

      return () {
        timer.cancel();
      };
    });

    return Neumorphic(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ref.watch(_timeTextProvider.select((value) => value)).maybeWhen(
              data: (timeText) => Text(timeText),
              orElse: () => Text('経過時間'),
            ),
      ),
    );
  }
}

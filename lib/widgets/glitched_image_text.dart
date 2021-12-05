import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/jpeg_repair_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlitchedImageText extends HookConsumerWidget {
  final text;

  const GlitchedImageText(this.text);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 32,
      height: 32,
      child: ref.watch(jpegRepairProvider(text).select((value) => value)).when(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final radioValues = StateProvider.autoDispose.family<int, Key>((_, __) => 1);

class RadioButtonList extends ConsumerWidget {
  final ValueChanged<int> onChange;
  final Key key;

  RadioButtonList({required this.onChange, required this.key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 16,
      runSpacing: 10,
      children: List.generate(
        10,
        (index) => NeumorphicRadio<int>(
          child: SizedBox(
            height: 64,
            width: 64,
            child: Center(
              child: Text("${index + 1}"),
            ),
          ),
          value: index + 1,
          groupValue: ref.watch(radioValues(key)),
          onChanged: (value) {
            if (value == null) {
              return;
            }

            ref.read(radioValues(key).state).state = value;
            onChange.call(value);
          },
        ),
      ),
    );
  }
}

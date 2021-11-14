import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final radioValue = StateProvider((_) => 1);

class RadioButtonList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: List.generate(
        10,
        (index) => NeumorphicRadio<int>(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Text("${index + 1}"),
            ),
          ),
          value: index + 1,
          groupValue: ref.watch(radioValue),
          onChanged: (value) {
            if (value == null) {
              return;
            }

            ref.read(radioValue.state).state = value;
          },
        ),
      ),
    );
  }
}

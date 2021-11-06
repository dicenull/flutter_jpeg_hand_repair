import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final groupValue = useState(0);

    return NeumorphicApp(
      themeMode: ThemeMode.light,
      home: Scaffold(
          appBar: NeumorphicAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Wrap(
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
                  groupValue: groupValue.value,
                  onChanged: (value) {
                    groupValue.value = value ?? groupValue.value;
                  },
                ),
              ),
            ),
          )),
    );
  }
}

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                'JPGを手動でなおそう！',
                style: TextStyle(color: Colors.lightGreen, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: NeumorphicButton(
                  onPressed: () {
                    GoRouter.of(context).go('/stages/switch');
                  },
                  child: Text('はじめる'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

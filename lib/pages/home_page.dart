import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_jpeg_hand_repair/controllers/glitch_time_controller.dart';
import 'package:flutter_jpeg_hand_repair/widgets/glitch_timer.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(glitchTimerProvider).reset();
    }, const []);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: GlitchTimer(),
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
                    ref.read(glitchTimerProvider).start();
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

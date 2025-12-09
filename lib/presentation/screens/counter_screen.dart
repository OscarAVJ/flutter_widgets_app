import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/presentation/providers/counter_provider.dart';
import 'package:flutter_widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;

    ///Leer el estado de un provider
    final int clickCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: isDarkMode
                ? Icon(Icons.dark_mode_outlined)
                : Icon(Icons.light_mode_rounded),
          ),
        ],
      ),
      body: Center(child: Text('Contador: $clickCounter', style: textStyle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///Actualizar
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

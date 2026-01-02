import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final colorsList = ref.watch(colorListProvider);
    final colorIndexProvider = ref.watch(selectedIndexColorProvide);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon: isDarkMode
                ? Icon(Icons.dark_mode_rounded)
                : Icon(Icons.light_mode_rounded),
          ),
        ],
      ),
      body: RadioGroup(
        onChanged: (value) {
          ref.read(selectedIndexColorProvide.notifier).state = value ?? 0;
        },
        groupValue: colorIndexProvider,
        child: ListView.builder(
          itemCount: colorsList.length,
          itemBuilder: (context, index) {
            final Color color = colorsList[index];
            return ListTile(
              title: Text('fdfds', style: TextStyle(color: color)),
              subtitle: Text('${color.toARGB32()}'),
              leading: Radio(value: index, activeColor: color),
            );
          },
        ),
      ),
    );
  }
}

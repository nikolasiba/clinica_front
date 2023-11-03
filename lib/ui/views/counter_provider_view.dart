import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clinica/providers/counter_provider.dart';
import 'package:clinica/ui/shared/custom_flat_button.dart';

class CounterProviderView extends StatelessWidget {
  const CounterProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(), child: _CounterProviderPageView());
  }
}

class _CounterProviderPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Contador Provider', style: TextStyle(fontSize: 20)),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Contador: ${counterProvider.counter}',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
                text: 'Incrementar',
                onPressed: () => counterProvider.increment()),
            CustomFlatButton(
                text: 'Decrementar',
                onPressed: () => counterProvider.decrement()),
          ],
        ),
      ],
    );
  }
}

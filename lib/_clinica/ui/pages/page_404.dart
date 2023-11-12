import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('No se encontró la página', style: TextStyle(fontSize: 20)),
            // CustomFlatButton(
            //     text: 'Regresar',
            //     onPressed: () => Navigator.pushNamed(context, '/stateful')),
          ],
        ),
      ),
    );
  }
}

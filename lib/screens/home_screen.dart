import 'package:flutter/material.dart';
import 'save_data_screen.dart';
import 'view_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lectura Segura')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 72, color: Colors.blueAccent),
            SizedBox(height: 32),
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Guardar datos cifrados'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SaveDataScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            OutlinedButton.icon(
              icon: Icon(Icons.visibility),
              label: Text('Ver datos guardados'),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ViewDataScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

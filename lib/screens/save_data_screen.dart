import 'package:flutter/material.dart';
import '../services/secure_storage_service.dart';

class SaveDataScreen extends StatefulWidget {
  const SaveDataScreen({super.key});

  @override
  State<SaveDataScreen> createState() => _SaveDataScreenState();
}

class _SaveDataScreenState extends State<SaveDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final storage = SecureStorageService();

  final Map<String, TextEditingController> controllers = {
    'username': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'readingHistory': TextEditingController(),
    'rewards': TextEditingController(),
    'social': TextEditingController(),
    'preferences': TextEditingController(),
    'usage': TextEditingController(),
    'ip': TextEditingController(),
    'device': TextEditingController(),
  };

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      for (var entry in controllers.entries) {
        await storage.saveData(entry.key, entry.value.text);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Datos cifrados guardados correctamente')),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guardar datos cifrados')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ...controllers.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      labelText: entry.key,
                      border: OutlineInputBorder(),
                    ),
                    obscureText: entry.key == 'password',
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Campo obligatorio'
                                : null,
                  ),
                );
              }),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.lock),
                label: Text('Guardar todo cifrado'),
                onPressed: _saveData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

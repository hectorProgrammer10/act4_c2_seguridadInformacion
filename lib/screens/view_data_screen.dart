import 'package:flutter/material.dart';
import '../services/secure_storage_service.dart';

class ViewDataScreen extends StatefulWidget {
  const ViewDataScreen({super.key});

  @override
  State<ViewDataScreen> createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  final storage = SecureStorageService();
  Map<String, String> _data = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final storedData = await storage.readAll();
    setState(() {
      _data = storedData;
    });
  }

  Future<void> _deleteKey(String key) async {
    await storage.deleteData(key);
    await _loadData();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Dato eliminado: $key')));
  }

  Future<void> _deleteAll() async {
    await storage.deleteAll();
    await _loadData();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Todos los datos fueron eliminados')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos cifrados'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            tooltip: 'Eliminar todo',
            onPressed:
                _data.isEmpty
                    ? null
                    : () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => AlertDialog(
                              title: Text('¿Eliminar todo?'),
                              content: Text(
                                'Esto borrará todos los datos guardados.',
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                                TextButton(
                                  child: Text('Eliminar'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _deleteAll();
                                  },
                                ),
                              ],
                            ),
                      );
                    },
          ),
        ],
      ),
      body:
          _data.isEmpty
              ? Center(child: Text('No hay datos cifrados guardados'))
              : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _data.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  final key = _data.keys.elementAt(index);
                  final value = _data[key]!;
                  return ListTile(
                    title: Text(key),
                    subtitle: Text(value),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteKey(key),
                    ),
                  );
                },
              ),
    );
  }
}

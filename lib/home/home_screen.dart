import 'dart:io';

import 'package:flutter/material.dart';
import 'add_plant_logic.dart';
import 'plant_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Plant> _plants = [];

  Future<void> _addPlant() async {
    final Plant? newPlant = await AddPlantLogic.addPlant();
    if (newPlant == null) return;

    setState(() {
      _plants.add(newPlant);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои растения'),
        centerTitle: true,
      ),

      body: _plants.isEmpty
          ? const Center(
              child: Text(
                'Нет растений.\nДобавьте первое!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _plants.length,
              itemBuilder: (context, index) {
                final plant = _plants[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.file(
                      File(plant.imagePath),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(plant.name),
                    subtitle: Text(plant.recommendation),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addPlant,
        child: const Icon(Icons.add),
      ),
    );
  }
}

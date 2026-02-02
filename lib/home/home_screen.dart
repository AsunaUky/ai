import 'package:ai/home/add_plant_logic.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Мои растения')),
      bottomNavigationBar: TextButton(
        onPressed: () {
          AddPlantLogic.addPlant(context as List<Plant>);
        },
        child: const Text('Добавить растение'),
      ),
    );
  }
}

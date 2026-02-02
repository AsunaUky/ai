import 'dart:async';

class AddPlantLogic {
  static Future<List<Plant>> addPlant(List<Plant> currentPlants) async {
    final String imagePath = await _pickImage();

    final Plant newPlant = await _sendToAi(imagePath);

    final List<Plant> updatedPlants = List.from(currentPlants);
    updatedPlants.add(newPlant);

    return updatedPlants;
  }

  static Future<String> _pickImage() async {
    await Future.delayed(const Duration(seconds: 1));
    return 'assets/images/plant.jpg';
  }

  static Future<Plant> _sendToAi(String imagePath) async {
    await Future.delayed(const Duration(seconds: 2));

    return Plant(

    );
  }
}

class Plant {
}

import 'dart:async';
import 'dart:math';

import 'package:image_picker/image_picker.dart';
import 'plant_model.dart';

class AddPlantLogic {
  static final ImagePicker _picker = ImagePicker();

  /// длоя добавляения растения
  static Future<Plant?> addPlant() async {
    final XFile? image = await _pickImage();
    if (image == null) return null;

    final Plant plant = await _sendToAi(image.path);
    return plant;
  }

  /// выбор изо
  static Future<XFile?> _pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  /// имитация  ai
  static Future<Plant> _sendToAi(String imagePath) async {
    await Future.delayed(const Duration(seconds: 2));

    final random = Random();

    final plants = [
      {
        'name': 'Фикус',
        'rec': 'Поливать 2 раза в неделю, избегать прямого солнца',
      },
      {
        'name': 'Кактус',
        'rec': 'Поливать раз в 10 дней, любит солнце',
      },
      {
        'name': 'Монстера',
        'rec': 'Полив раз в неделю, рассеянный свет',
      },
    ];

    final result = plants[random.nextInt(plants.length)];

    return Plant(
      name: result['name']!,
      imagePath: imagePath,
      recommendation: result['rec']!,
    );
  }
}

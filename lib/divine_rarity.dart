import 'plant.dart';

class divine_rarity extends Plant {
  final int seedValue;

  divine_rarity({
    required String name,
    required String type,
    this.seedValue = 160000,
    int growthStage = 0,
    int health = 100,
  }) : super(name: name, type: type, growthStage: growthStage, health: health);

  void harvest() {
    if (growthStage >= 5 && health > 0) {
      print('🌻 $name harvested! You earned $seedValue seeds.');
    } else if (health <= 0) {
      print('❌ $name is dead and cannot be harvested.');
    } else {
      print('🌿 $name is not ready to harvest.');
    }
  }

  @override
  void showInfo() {
    print(
      "Plant name: $name | Type: $type | Growth Stage: $growthStage | Health: $health | Seed Value: $seedValue"
    );
  }
}
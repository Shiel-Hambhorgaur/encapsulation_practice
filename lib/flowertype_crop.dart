import 'plant.dart';

class FlowertypeCrop extends Plant {
  final int fragranceIntensity; // scale from 1 to 10

  FlowertypeCrop({
    required String name,
    required String type,
    this.fragranceIntensity = 5,
    int growthStage = 0,
    int health = 100,
  }) : super(
          name: name,
          type: type,
          growthStage: growthStage,
          health: health,
        );

  void smell() {
    print('🌹 $name has a fragrance intensity of $fragranceIntensity out of 10.');
  }

  @override
  void grow() {
    super.grow();
    if (growthStage == 5) {
      print('🌸 $name is fully bloomed and smells wonderful!');
    }
  }

  @override
  void showInfo() {
    print(
      "Plant name: $name | Type: $type | Growth Stage: $growthStage | Health: $health | Fragrance Intensity: $fragranceIntensity"
    );
  }
}

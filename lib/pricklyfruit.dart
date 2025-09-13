import 'plant.dart';

class PricklyFruit extends Plant {
  final double spikeLength; // in centimeters

  PricklyFruit({required String name,required String type, this.spikeLength = 5.0,int growthStage = 0,int health = 100,}) 
  : super(name: name, type: type, growthStage: growthStage, health: health);

  void displaySpikes() {
    print('🐉 $name has spikes approximately $spikeLength cm long.');
  }

  @override
  void grow() {
    super.grow();
    if (growthStage == 5) {
      print('🔥 $name is now fully grown and its spikes are sharp and vibrant!');
    }
  }

  @override
  void showInfo() {
    print(
      "Plant name: $name | Type: $type | Growth Stage: $growthStage | Health: $health | Spike Length: ${spikeLength}cm"
    );
  }
}
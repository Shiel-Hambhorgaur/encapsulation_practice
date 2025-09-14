import 'plant.dart';
import 'flowertype_crop.dart';
import 'pricklyfruit.dart';
import 'divine_rarity.dart';

void main() {
  print('--- Demo: Base Plant ---');

  Plant plant1 = Plant(name: 'Rose', type: 'Flower Type Crop');
  Plant plant2 = Plant(name: 'Cactus', type: 'Prickly Fruit', growthStage: 3, health: 80);

  plant1.showInfo();
  plant1.grow();
  plant1.water(20);

  print('Growth Stage of ${plant1.name}: ${plant1.growthStage}'); // getter
  print('Health of ${plant1.name}: ${plant1.health}'); // getter

  plant2.showInfo();
  plant2.grow();
  plant2.water(-10);

  print('--- Demo: PricklyFruit (derived) ---');
  PricklyFruit cactus = PricklyFruit(name: 'Cactus', type: 'Prickly Fruit', spikeLength: 7.5);
  cactus.showInfo(); // gi override
  cactus.grow(); // gi override
  cactus.displaySpikes(); // unique method 

  print('\n--- Demo: Derived Class (FlowertypeCrop) ---');

  FlowertypeCrop rose = FlowertypeCrop(name: "Rose", type: "Flower Type Crop", fragranceIntensity: 7);

  rose.showInfo(); // initial state
  rose.smell();    // unique method

  for (int i = 0; i < 5; i++) {
    rose.grow();   // Should reach stage 5 and print blooming message
  }
  rose.showInfo(); // Final state

  print('--- Demo: DivineRarity (derived) ---');
  DivineRarity rareFlower = DivineRarity(name: 'Sunflower',type: 'Rare Flower',seedValue: 250000,
    growthStage: 4,health: 95,);

  rareFlower.showInfo(); // overridden 
  rareFlower.grow(); // inherited 
  rareFlower.harvest(); // unique
  // Grow and harvest
  rareFlower.grow();
  rareFlower.harvest();
}
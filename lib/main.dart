import 'plant.dart';
import 'divine_rarity.dart';

void main() {
  print('--- Demo: Base Plant ---');

  Plant plant1 = Plant(name: 'Rose', type: 'Flower Type Crop');
  Plant plant2 = Plant(name: 'Cactus',type: 'Prickly Fruit',growthStage: 3,health: 80,);

  plant1.showInfo();
  plant1.grow();
  plant1.water(20);

  print('Growth Stage of ${plant1.name}: ${plant1.growthStage}'); // getter
  print('Health of ${plant1.name}: ${plant1.health}'); // getter

  plant2.showInfo();
  plant2.grow();
  plant2.water(-10);

  print('--- Demo: DivineRarity (derived) ---');
  divine_rarity rareFlower = divine_rarity(name: 'Celestial Bloom', type: 'Rare Flower',seedValue: 250000,
    growthStage: 4,
    health: 95,);

  rareFlower.showInfo(); // overridden 
  rareFlower.grow(); // inherited 
  rareFlower.harvest(); // unique

  // Grow and harvwst
  rareFlower.grow();
  rareFlower.harvest();
}
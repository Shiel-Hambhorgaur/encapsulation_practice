import 'plant.dart';
import 'pricklyfruit.dart';

void main() {
  print('--- Demo: Base Plant ---');

  Plant plant1 = Plant(name: 'Rose', type: 'Flower Type Crop');
  Plant plant2 = Plant(name: 'Cactus',type: 'Prickly Fruit',growthStage: 3,health: 80,);

  plant1.showInfo();
  plant1.grow();
  plant1.water(20);

  print('Growth Stage of ${plant1.name}: ${plant1.growthStage}'); // getter
  print('Health of ${plant1.name}: ${plant1.health}'); // gettr

  plant2.showInfo();
  plant2.grow();
  plant2.water(-10);


  print('--- Demo: PricklyFruit (derived) ---');
  PricklyFruit dragonFruit = PricklyFruit(name: 'Dragon Fruit', type: 'Prickly Fruit', spikeLength: 7.5);
  dragonFruit.showInfo(); // gi override
  dragonFruit.grow(); // gi ovveride
  dragonFruit.displaySpikes(); // unique method 
}
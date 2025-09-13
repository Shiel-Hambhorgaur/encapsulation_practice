import 'plant.dart';
import 'DivineRarityFlower.dart';

void main() {
  print('--- Demo: Base Plant ---');

  Plant plant1 = Plant(name: 'Rose', type: 'Flower Type Crop');
  Plant plant2 = Plant(
    name: 'Cactus',
    type: 'Prickly Fruit',
    growthStage: 3,
    health: 80,
  );

  plant1.showInfo();
  plant1.grow();
  plant1.water(20);

  print('Growth Stage of ${plant1.name}: ${plant1.growthStage}'); // getter
  print('Health of ${plant1.name}: ${plant1.health}'); // getter

  plant2.showInfo();
  plant2.grow();
  plant2.water(-10);

  print('\n--- Demo: Derived Class (DivineRarityFlower) ---');

  // Create DivineRarityFlower instances with new properties
  DivineRarityFlower divineFlower1 = DivineRarityFlower(
    name: 'Mystic Rose',
    type: 'Divine Flower',
    flowerColor: 'Purple',
  );

  DivineRarityFlower divineFlower2 = DivineRarityFlower(
    name: 'Golden Lotus',
    type: 'Sacred Flower',
    seedValue: 250000,
    growthStage: 4,
    health: 90,
    flowerColor: 'Golden',
  );

  // Show initial state with new properties
  print('\nInitial state:');
  divineFlower1.showInfo();
  divineFlower2.showInfo();

  print('\n--- Testing Getters ---');
  print('${divineFlower1.name} properties:');
  print('  - Seed Value: ${divineFlower1.seedValue}'); // getter
  print('  - Flower Color: ${divineFlower1.flowerColor}'); // getter
  print('  - Blooming Status: ${divineFlower1.isBloomingNow}'); // getter
  print('  - Rarity Level: ${divineFlower1.rarityLevel}'); // computed getter

  print('${divineFlower2.name} properties:');
  print('  - Seed Value: ${divineFlower2.seedValue}'); // getter
  print('  - Flower Color: ${divineFlower2.flowerColor}'); // getter
  print('  - Blooming Status: ${divineFlower2.isBloomingNow}'); // getter
  print('  - Rarity Level: ${divineFlower2.rarityLevel}'); // computed getter

  print('\n--- Testing Setters with Validation ---');
  
  // Test seed value setter
  print('Testing seedValue setter:');
  divineFlower1.seedValue = 300000; // Valid
  divineFlower1.seedValue = 600000; // Invalid - should show error
  divineFlower1.seedValue = -5000;  // Invalid - should show error
  
  // Test flower color setter
  print('\nTesting flowerColor setter:');
  divineFlower1.flowerColor = 'Silver'; // Valid
  divineFlower1.flowerColor = 'Blue';   // Invalid - should show error
  
  // Test blooming setter (should fail - growth stage too low)
  print('\nTesting isBloomingNow setter:');
  divineFlower1.isBloomingNow = true; // Should fail - growth stage 0

  // Demonstrate inherited methods from base Plant class
  print('\n--- Using Base Class Methods ---');
  print('Growing ${divineFlower1.name}:');
  divineFlower1.grow(); // Inherited from Plant
  divineFlower1.water(15); // Inherited from Plant

  print('Growing ${divineFlower2.name}:');
  divineFlower2.grow(); // Inherited from Plant
  divineFlower2.water(10); // Inherited from Plant

  // Show updated state after using base methods
  print('\nAfter growing and watering:');
  divineFlower1.showInfo(); // Overridden method
  divineFlower2.showInfo(); // Overridden method

  print('\n--- Testing New Methods ---');
  
  // Test bloom method
  print('Testing bloom() method:');
  divineFlower1.bloom(); // Should fail - growth stage too low
  divineFlower2.bloom(); // Should work - growth stage 5
  
  // Test enhance method
  print('\nTesting enhance() method:');
  divineFlower1.enhance(50000); // Should work
  divineFlower2.enhance(-1000);  // Should fail - negative value

  // Demonstrate harvest method (specific to DivineRarityFlower)
  print('\n--- Harvest Attempts ---');
  print('Attempting to harvest ${divineFlower1.name}:');
  divineFlower1.harvest(); // Should fail - not mature enough

  print('Attempting to harvest ${divineFlower2.name}:');
  divineFlower2.harvest(); // Should work and give blooming bonus

  // Grow flowers to maturity and try harvesting again
  print('\n--- Growing to Maturity ---');
  // Grow divineFlower1 to harvest stage
  while (divineFlower1.growthStage < 5) {
    divineFlower1.grow();
  }

  print('After growing to maturity:');
  divineFlower1.showInfo();

  // Now try blooming and harvesting the mature flower
  print('\n--- Mature Flower Operations ---');
  divineFlower1.bloom(); // Should work now
  print('After blooming:');
  divineFlower1.showInfo();
  
  print('Final harvest:');
  divineFlower1.harvest(); // Should succeed with bonus

  print('\n--- Setter Validation After Growth ---');
  // Test blooming setter again (should work now)
  divineFlower1.isBloomingNow = true;  // Should work
  divineFlower1.isBloomingNow = false; // Should work

  print('\n--- Polymorphism Demo ---');
  // Create a list of Plants (both base and derived)
  List<Plant> garden = [plant1, plant2, divineFlower1, divineFlower2];
  
  print('Garden overview (using polymorphism):');
  for (int i = 0; i < garden.length; i++) {
    print('Plant ${i + 1}:');
    garden[i].showInfo(); // Calls appropriate showInfo() method
    if (garden[i] is DivineRarityFlower) {
      // Cast to access derived class methods and properties
      DivineRarityFlower flower = garden[i] as DivineRarityFlower;
      print('  Special properties - Rarity: ${flower.rarityLevel}, Color: ${flower.flowerColor}');
      flower.harvest();
    }
    print('---');
  }

  print('\n--- Final Encapsulation Demonstration ---');
  print('Accessing properties through getters:');
  print('${divineFlower1.name} - Growth Stage: ${divineFlower1.growthStage} (inherited getter)');
  print('${divineFlower1.name} - Health: ${divineFlower1.health} (inherited getter)');
  print('${divineFlower1.name} - Seed Value: ${divineFlower1.seedValue} (custom getter)');
  print('${divineFlower1.name} - Flower Color: ${divineFlower1.flowerColor} (custom getter)');
  print('${divineFlower1.name} - Blooming: ${divineFlower1.isBloomingNow} (custom getter)');
  print('${divineFlower1.name} - Rarity: ${divineFlower1.rarityLevel} (computed getter)');
  
  print('\n--- Setter Usage Summary ---');
  print('✅ Used setters with validation for:');
  print('  - seedValue: Range validation (0-500,000)');
  print('  - flowerColor: Valid color options');
  print('  - isBloomingNow: Growth stage requirement');
  
  print('\n❌ Demonstrated validation failures:');
  print('  - Invalid seed values (too high/negative)');
  print('  - Invalid colors');
  print('  - Blooming when too young');
  
  print('\n🔒 Encapsulation maintained:');
  print('  - Private properties (_seedValue, _flowerColor, _isBloomingNow)');
  print('  - Controlled access through getters and setters');
  print('  - Data validation prevents invalid states');
}
import 'plant.dart';

class DivineRarityFlower extends Plant {
  int _seedValue;        // Private seed value for encapsulation
  String _flowerColor;   // Private flower color property
  bool _isBloomingNow;   // Private blooming status

  // Constructor
  DivineRarityFlower({
    required String name,
    required String type,
    int seedValue = 160000,
    int growthStage = 0,
    int health = 100,
    String flowerColor = "Golden",
    bool isBloomingNow = false,
  }) : _seedValue = seedValue,
       _flowerColor = flowerColor,
       _isBloomingNow = isBloomingNow,
       super(name: name, type: type, growthStage: growthStage, health: health);

  // Getters
  int get seedValue => _seedValue;
  String get flowerColor => _flowerColor;
  bool get isBloomingNow => _isBloomingNow;
  
  // Computed getter - rarity based on seed value
  String get rarityLevel {
    if (_seedValue >= 200000) return "Legendary";
    if (_seedValue >= 150000) return "Divine";
    if (_seedValue >= 100000) return "Rare";
    return "Common";
  }

  // Setters with validation
  
  // Setter 1 - seed value with range validation
  set seedValue(int value) {
    if (value >= 0 && value <= 500000) {
      _seedValue = value;
      print('🌟 Seed value updated to $_seedValue');
    } else {
      print('❌ Invalid seed value. Must be between 0 and 500,000');
    }
  }
  
  // Setter 2 - flower color with valid options
  set flowerColor(String color) {
    List<String> validColors = ["Golden", "Silver", "Purple", "White", "Pink", "Red"];
    if (validColors.contains(color)) {
      _flowerColor = color;
      print('🎨 Flower color changed to $_flowerColor');
    } else {
      print('❌ Invalid color. Valid colors: ${validColors.join(", ")}');
    }
  }
  
  // Setter 3 - blooming status with growth stage validation
  set isBloomingNow(bool blooming) {
    if (growthStage >= 3) {
      _isBloomingNow = blooming;
      if (blooming) {
        print('🌺 $name has started blooming!');
      } else {
        print('🥀 $name stopped blooming.');
      }
    } else {
      print('🌿 $name is too young to bloom (needs growth stage 3+)');
    }
  }

  // Method 1 - harvest with bonus calculation
  void harvest() {
    if (growthStage >= 5 && health > 0) {
      print('🌻 $name harvested! You earned $_seedValue seeds.');
      
      // Bonus for blooming flowers
      if (_isBloomingNow) {
        int bonus = (_seedValue * 0.1).round();
        print('🎁 Blooming bonus: +$bonus seeds!');
      }
      
      // Reset bloom status after harvest
      _isBloomingNow = false;
    } else if (health <= 0) {
      print('❌ $name is dead and cannot be harvested.');
    } else {
      print('🌿 $name is not ready to harvest.');
    }
  }

  // Method 2 - bloom with health and growth validation
  void bloom() {
    if (growthStage >= 3 && health > 50) {
      isBloomingNow = true; // Uses setter with validation
    } else if (health <= 50) {
      print('💔 $name is too weak to bloom (health: $health)');
    } else {
      print('🌱 $name is too young to bloom (stage: $growthStage)');
    }
  }

  // Method 3 - enhance flower with seed value increase
  void enhance(int enhancement) {
    if (enhancement <= 0) {
      print('❌ Enhancement amount must be positive.');
      return;
    }
    if (health <= 0) {
      print('❌ $name is dead and cannot be enhanced.');
      return;
    }
    
    int oldValue = _seedValue;
    seedValue = _seedValue + enhancement; // Uses setter with validation
    
    if (_seedValue > oldValue) {
      print('✨ $name enhanced! Rarity level: $rarityLevel');
    }
  }

  // Override showInfo - display complete flower information
  @override
  void showInfo() {
    print('Plant: $name | Type: $type | Growth Stage: $growthStage | Health: $health');
    print('Seed Value: $_seedValue | Rarity: $rarityLevel | Color: $_flowerColor | Blooming: ${_isBloomingNow ? "Yes" : "No"}');
  }
}
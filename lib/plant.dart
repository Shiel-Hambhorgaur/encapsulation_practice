class Plant {
  final String name;
  final String type;
  int _growthStage;
  int _health;

  // Constructor
  Plant({
    required this.name,
    required this.type,
    int growthStage = 0,
    int health = 100,
  })  : _growthStage = growthStage,
        _health = health;

  // getters
  int get growthStage => _growthStage;
  int get health => _health;

  // Method 1 tubo
  void grow() {
    if (_health <= 0) {
      print('❌ $name cannot grow, it is dead.');
      return;
    }
    if (_growthStage >= 5) {
      print('🌿 $name is fully grown!');
      return;
    }
    _growthStage++;
    print('🌱 $name has grown to stage $_growthStage.');
  }

  // Method 2 increase han health 
  void water(int amount) {
    if (amount <= 0) {
      print('❌ Water amount must be positive.');
      return;
    }
    if (_health <= 0) {
      print('❌ $name is dead and cannot be watered.');
      return;
    }
    _health += amount;
    if (_health > 100) _health = 100;
    print('💧 $name watered. Health is now $_health.');
  }

  // Method 3 info
  void showInfo() {
    print('Plant: $name | Type: $type | Growth Stage: $_growthStage | Health: $_health');
  }
}
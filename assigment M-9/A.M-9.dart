
abstract class Animal {
  String _name;

  Animal(this._name);

  void makeSound();

  String getName() {
    return _name;
  }
}

 class Lion extends Animal {
  double _maneSize;

  Lion(String name, double maneSize) : _maneSize = 0, super(name) {
    setManeSize(maneSize);
  }

  void setManeSize(double size) {
    if (size < 0) {
      print(" Mane size negative হতে পারবে না!");
    } else {
      _maneSize = size;
    }
  }

  // getter
  double getManeSize() => _maneSize;

  @override
  void makeSound() {
    print(" ${getName()}: Roarrr!!");
  }
}


class Elephant extends Animal {
  double _trunkLength;

  Elephant(String name, double trunkLength) : _trunkLength = 0, super(name) {
    setTrunkLength(trunkLength);
  }

  void setTrunkLength(double length) {
    if (length < 0) {
      print(" Trunk length negative হতে পারবে না!");
    } else {
      _trunkLength = length;
    }
  }

  double getTrunkLength() => _trunkLength;

  @override
  void makeSound() {
    print(" ${getName()} : Pawoooo!!");
  }
}


class Parrot extends Animal {
  int _vocabularySize;

  Parrot(String name, int vocabularySize) : _vocabularySize = 0, super(name) {
    setVocabularySize(vocabularySize);
  }

  void setVocabularySize(int size) {
    if (size < 0) {
      print("  Vocabulary size negative হতে পারবে না!");
    } else {
      _vocabularySize = size;
    }
  }

  int getVocabularySize() => _vocabularySize;

  @override
  void makeSound() {
    print(" ${getName()} : Hello! Squawk!!");
  }
}


void main() {
  List<Animal> zoo = [];

  Lion lion = Lion("Simba", 25.5);
  Elephant elephant = Elephant("Dumbo", 150.0);
  Parrot parrot = Parrot("Polly", 50);

  zoo.add(lion);
  zoo.add(elephant);
  zoo.add(parrot);

  for (var animal in zoo) {
    print("");
    print("Animal Name: ${animal.getName()}");

    if (animal is Lion) {
      print("Mane Size: ${animal.getManeSize()} cm");
    } else if (animal is Elephant) {
      print("Trunk Length: ${animal.getTrunkLength()} cm");
    } else if (animal is Parrot) {
      print("Vocabulary Size: ${animal.getVocabularySize()} words");
    }


    animal.makeSound();
  }
}

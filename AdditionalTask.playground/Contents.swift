import UIKit

/*
 Class-ი სახელით Animal, with properties: name, species, age. ამ class აქვს:
 Designated init ამ properties ინიციალიზაციისთვის.
 Method makeSound() რომელიც დაგვი-print-ავს ცხოველის ხმას.
 */

class Animal {
    let name: String
    let species: String
    var age: Int
    
    init(name: String, species: String, age: Int) {
        self.name = name
        self.species = species
        self.age = age
    }
    
    required init() {
        fatalError("Animal Class is Abstract and can't be instanciated directly. ")
    }
    
    func makeSound() {
        print("\(species) named \(name) makes sound 🔊")
    }
}

/*
 Animal-ის child class სახელად Mammal (ძუძუმწოვრები).
 დამატებითი String property -> furColor.
 Override method makeSound() სადაც აღწერთ შესაბამის ხმას.
 Init-ი -> სახელით, ასაკით, ბეწვის ფერით.
 convenience init -> სახელით, ბეწვის ფერით.
 */

class Mammal: Animal {
    let furColor: String
    
    init(name: String, age: Int, furColor: String, species: String) {
        self.furColor = furColor
        super.init(name: name, species: species, age: age)
    }
    
    convenience init(name: String, furColor: String) {
        self.init(name: name, age: 0, furColor: furColor, species: "N/A")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("\(name) with \(furColor) fur makes sound - 🔊💥")
    }
}

/*
 Animal-ის child class: Bird.
 დამატებითი Bool property: canFly.
 Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
 Init -> სახელით, ასაკით, შეუძლია თუ არა ფრენა.
 convenience init -> სახელით, შეუძლია თუ არა ფრენა.
 */

class Bird: Animal {
    let canFly: Bool
    
    init(name: String, age: Int, canFly: Bool, species: String) {
        self.canFly = canFly
        super.init(name: name, species: species, age: age)
    }
    
    convenience init(name: String, canFly: Bool) {
        self.init(name: name, age: 2, canFly: canFly, species: "N/A")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("\(name) makes sound 🪽🔉")
    }
}

/*
 Animal-ის child class: Reptile.
 დამატებითი Bool property: isColdBlooded.
 Override method makeSound() სადაც ავღწერ შესაბამის ხმას.
 Failable Init თუ რეპტილიას ასაკი ნაკლებია 0-ზე ვაბრუნებთ nil-ს.
 */

class Reptile: Animal {
    let isColdBlooded: Bool
    
    init?(name: String, species: String, age: Int, isColdBlooded: Bool) {
        self.isColdBlooded = isColdBlooded
        super.init(name: name, species: species, age: age)
        
        if age < 0 {
            return nil
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("\(name) makes sound 🐊🐍🦎📢")
    }
}

/*
 Mammal-ის child class: Lion.
 დამატებით String property: maneColor.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
 */

class Lion: Mammal {
    let maneColor: String
    
    init(maneColor: String, name: String, age: Int, furColor: String, species: String) {
        self.maneColor = maneColor
        super.init(name: name, age: age, furColor: furColor, species: species)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Lion \(name) makes sound 🦁💥")
    }
}

/*
 Bird-ის child class: Eagle.
 დამატებით Double property: wingspan.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
 */

class Eagle: Bird {
    var wingspan: Double
    
    init(name: String, age: Int, canFly: Bool, wingspan: Double, species: String) {
        self.wingspan = wingspan
        super.init(name: name, age: age, canFly: canFly, species: species)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    override func makeSound() {
        print("Eagle \(name) makes sound 🦅🔊")
    }
}

/*
 Reptil-ის child class: Snake.
 დამატებით Double property: length.
 Override მეთოდი makeSound() სადაც ავღწერ შესაბამის ხმას.
 */

class Snake: Reptile {
    var length: Double
    
    init?(length: Double,
          name: String,
          species: String,
          age: Int,
          isColdBlooded: Bool
    ) {
        
        self.length = length
        super.init(name: name, species: species, age: age, isColdBlooded: isColdBlooded)
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}

/*
 შევქმნათ ზოოპარკის ცხოველების Array, დავამატოთ მასში სხვადასხვა სახის ცხოველები: 2-2 Mammal, Bird, Reptile ასევე შევქმნათ 1-1 Lion, Eagle, Snake.
 */

var zoo: [Animal] = []

let panda = Mammal(name: "Panda", age: 3, furColor: "Black&White", species: "Mammal")
let monkey = Mammal(name: "Monkey", age: 5, furColor: "Brown", species: "Mammal")
let flamingo = Bird(name: "Pink Flamingo", age: 2, canFly: false, species: "Bird")
let parrot = Bird(name: "Parrot", canFly: true)
let lion = Lion(maneColor: "Brown", name: "Lion", age: 5, furColor: "Brown", species: "Mammal")
let eagle = Eagle(name: "Eagle", age: 1, canFly: true, wingspan: 1.8, species: "Bird")

if let lizard = Reptile(name: "Lizard", species: "Reptile", age: 2, isColdBlooded: true) {
    zoo.append(lizard)
    print("Lizard initialized successfully.")
} else {
    print("Lizard initialization failed.")
}

if let crocodile = Reptile(name: "Crocodile", species: "Reptile", age: 1, isColdBlooded: true) {
    zoo.append(crocodile)
    print("Crocodile initialized successfully.")
} else {
    print("Crocodile initialization failed.")
}

if let snake = Reptile(name: "Snake", species: "Reptile", age: 2, isColdBlooded: true) {
    zoo.append(snake)
    print("Snake initialized successfully.")
} else {
    print("Snake initialization failed.")
}

zoo.append(panda)
zoo.append(monkey)
zoo.append(flamingo)
zoo.append(parrot)
zoo.append(lion)
zoo.append(eagle)

print("------------------------------")
/*
 დავბეჭდოთ ჩვენი Array-იდან, ყველა ცხოველის სახელი, სახეობა, ასაკი, და ასე გამოვიძახოთ makeSound მეთოდი.
 */

for animal in zoo {
    print("\(animal.species) named \(animal.name) is \(animal.age) years old")
    animal.makeSound()
}

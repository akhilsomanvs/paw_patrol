import 'package:paw_patrol/data/local/entities/pet_entity.dart';

enum PetCategory { Recommended, All, Dog, Cat, Fish, Rabbit }

class DataConstants {
  static List<String> petSpecies = [
    "recommended",
    "all",
    "dog",
    "cat",
    "fish",
    "rabbit",
  ];

  static String getCategoryIconPath(String category) {
    int index = PetCategory.values.indexWhere((element) => element.name.toLowerCase() == category.toLowerCase());
    if (index >= 0) {
      return getCategoryIcon(PetCategory.values[index]);
    }
    return getCategoryIcon(PetCategory.Dog);
  }

  static String getCategoryIcon(PetCategory category) {
    const assetIconPath = "assets/icons";
    switch (category) {
      case PetCategory.Recommended:
        return "$assetIconPath/ic_recommended.svg";
      case PetCategory.All:
        return "$assetIconPath/ic_all_pets.svg";
      case PetCategory.Dog:
        return "$assetIconPath/ic_dog.svg";
      case PetCategory.Cat:
        return "$assetIconPath/ic_cat.svg";
      case PetCategory.Fish:
        return "$assetIconPath/ic_fish.svg";
      case PetCategory.Rabbit:
        return "$assetIconPath/ic_rabbit.svg";
    }
  }

  static List<PetEntity> mockPetsData = [
    PetEntity.fromJson(const {
      "id": 1,
      "name": "Fluffy",
      "age": 2,
      "price": 100,
      "character": "Fluffy is a playful and energetic dog. She loves chasing balls and going for long walks in the park.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067695088-ENM7V3W64DVOJ66N5DMC/220327_vretenar1129.jpg?format=750w",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 2,
      "name": "Whiskers",
      "age": 1,
      "price": 50,
      "character": "Whiskers is a curious and friendly cat. He enjoys exploring new places and cuddling up on laps.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-2.jpg",
      "sex": "male",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 3,
      "name": "Bubbles",
      "age": 3,
      "price": 75,
      "character": "Bubbles is a calm and gentle goldfish. She adds a touch of serenity to any environment.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-2.jpg",
      "sex": "female",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 4,
      "name": "Cotton",
      "age": 1,
      "price": 80,
      "character": "Cotton is a playful and adorable rabbit. He loves hopping around and enjoys being petted.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-MrHamster.jpg",
      "sex": "male",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 5,
      "name": "Max",
      "age": 4,
      "price": 150,
      "character": "Max is a loyal and intelligent dog. He enjoys learning new tricks and going on adventures.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1577151929092-U3WI1YX9JXYOEV4HQOJ1/bernese-mountain-dog-portrait-photography-studio.jpg?format=750w",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 6,
      "name": "Smokey",
      "age": 2,
      "price": 60,
      "character": "Smokey is a calm and independent cat. He enjoys lounging in sunny spots and observing his surroundings.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-10.jpg",
      "sex": "male",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 7,
      "name": "Nemo",
      "age": 2,
      "price": 40,
      "character": "Nemo is an active and colorful fish. He loves swimming in his tank and exploring his aquatic world.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-3.jpg",
      "sex": "male",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 8,
      "name": "Hazel",
      "age": 1,
      "price": 70,
      "character": "Hazel is a friendly and playful rabbit. She enjoys hopping around and munching on fresh veggies.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-jianghongyan-1.jpg",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 9,
      "name": "Buddy",
      "age": 3,
      "price": 120,
      "character": "Buddy is a loving and protective dog. He enjoys cuddling and being a loyal companion.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067767276-CSC3YOIC56RTQGZ4MNWT/victorian-bulldog-portrait.jpg?format=750w",
      "sex": "male",
      "color": "golden"
    }),
    PetEntity.fromJson(const {
      "id": 10,
      "name": "Milo",
      "age": 1,
      "price": 55,
      "character": "Milo is an adventurous and curious cat. He loves exploring new places and chasing after toys.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-10.jpg",
      "sex": "male",
      "color": "tabby"
    }),
    PetEntity.fromJson(const {
      "id": 11,
      "name": "Bubbles Jr.",
      "age": 1,
      "price": 25,
      "character": "Bubbles Jr. is a small and vibrant fish. He brings color and life to any aquarium.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-5.jpg",
      "sex": "male",
      "color": "blue"
    }),
    PetEntity.fromJson(const {
      "id": 12,
      "name": "Coco",
      "age": 2,
      "price": 90,
      "character": "Coco is a friendly and curious rabbit. She loves exploring her surroundings and enjoys gentle petting.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-Photovova-1.jpg",
      "sex": "female",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 13,
      "name": "Charlie",
      "age": 5,
      "price": 180,
      "character": "Charlie is an active and playful dog. He enjoys outdoor activities and has a loyal and affectionate nature.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1634836117356-QFH28RPYV5A6JIYYGS1D/gsd-portrait-jane-thomson-vancouver-dog-photographer.jpg?format=750w",
      "sex": "male",
      "color": "black and white"
    }),
    PetEntity.fromJson(const {
      "id": 14,
      "name": "Luna",
      "age": 2,
      "price": 65,
      "character": "Luna is an independent and elegant cat. She enjoys quiet moments and likes to be admired from a distance.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-5.jpg",
      "sex": "female",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 15,
      "name": "Sparky",
      "age": 2,
      "price": 45,
      "character": "Sparky is an energetic and lively fish. He adds a playful touch to any aquarium.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-6.jpg",
      "sex": "male",
      "color": "red"
    }),
    PetEntity.fromJson(const {
      "id": 16,
      "name": "Oreo",
      "age": 1,
      "price": 75,
      "character": "Oreo is a friendly and sociable rabbit. He enjoys hopping around and interacting with people.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-Daniel-McCarthy.jpg",
      "sex": "male",
      "color": "black and white"
    }),
    PetEntity.fromJson(const {
      "id": 17,
      "name": "Cooper",
      "age": 3,
      "price": 110,
      "character": "Cooper is an intelligent and obedient dog. He enjoys learning new tricks and loves his daily walks.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067694835-2EWLMSNXSUQH237PU7H5/220327_vretenar1121.jpg?format=750w",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 18,
      "name": "Mittens",
      "age": 1,
      "price": 55,
      "character": "Mittens is a playful and mischievous cat. She loves batting at toys and climbing to high places.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-6.jpg",
      "sex": "female",
      "color": "orange and white"
    }),
    PetEntity.fromJson(const {
      "id": 19,
      "name": "Goldie",
      "age": 2,
      "price": 50,
      "character": "Goldie is a graceful and beautiful fish. She adds a touch of elegance to any aquarium.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-7.jpg",
      "sex": "female",
      "color": "gold"
    }),
    PetEntity.fromJson(const {
      "id": 20,
      "name": "Hopper",
      "age": 1,
      "price": 80,
      "character": "Hopper is an energetic and curious rabbit. He loves exploring and hopping around his play area.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-Matt-Pike.jpg",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 21,
      "name": "Rocky",
      "age": 3,
      "price": 130,
      "character": "Rocky is a strong and adventurous dog. He enjoys outdoor activities and has a playful and loyal nature.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1628113163152-WIW1VQT506X6651QX2XP/golden-doodle-portrait-by-jane-thomson-photography.jpg?format=750w",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 22,
      "name": "Misty",
      "age": 2,
      "price": 60,
      "character": "Misty is a graceful and affectionate cat. She loves to be pampered and enjoys cuddling with her human friends.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-8.jpg",
      "sex": "female",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 23,
      "name": "Finley",
      "age": 2,
      "price": 35,
      "character": "Finley is a small and lively fish. He enjoys swimming and exploring every nook and corner of his tank.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-8.jpg",
      "sex": "male",
      "color": "blue"
    }),
    PetEntity.fromJson(const {
      "id": 24,
      "name": "Caramel",
      "age": 1,
      "price": 70,
      "character": "Caramel is a sweet and playful rabbit. She loves nibbling on fresh greens and hopping around her cozy burrow.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-Paige-Cody.jpg",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 25,
      "name": "Bruno",
      "age": 5,
      "price": 200,
      "character": "Bruno is a loyal and protective dog. He enjoys long walks and is always ready to keep you company.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067715398-QR7G5ST10SWQ4DW5Y7CP/bernadoodle-portrait-vancouver-jane-thomson.jpg?format=750w",
      "sex": "male",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 26,
      "name": "Lily",
      "age": 3,
      "price": 75,
      "character": "Lily is an elegant and gentle cat. She enjoys basking in the sunlight and loves a cozy lap to curl up on.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-8.jpg",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 27,
      "name": "Bubbles II",
      "age": 1,
      "price": 30,
      "character": "Bubbles II is a vibrant and energetic fish. He adds color and liveliness to any aquarium he swims in.",
      "species": "fish",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2016/06/fish-1.jpg",
      "sex": "male",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 28,
      "name": "Hopper Jr.",
      "age": 2,
      "price": 90,
      "character": "Hopper Jr. is a curious and playful rabbit. He loves exploring new places and enjoys gentle petting.",
      "species": "rabbit",
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2021/11/Rabbit-Photography-%D0%A1%D1%82%D0%B5%D0%BF%D0%B0%D0%BD-%D0%93%D0%B0%D0%BB%D0%B0%D0%B3%D0%B0%D0%B5%D0%B2.jpg",
      "sex": "male",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 29,
      "name": "Bella",
      "age": 4,
      "price": 150,
      "character": "Bella is an intelligent and active dog. She loves learning new tricks and is always up for an adventure.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1655067697382-AL2JDF650QJSIPXRNIUD/220421_babe0048.jpg?format=750w",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 30,
      "name": "Simba",
      "age": 2,
      "price": 60,
      "character": "Simba is a majestic and confident cat. He enjoys exploring his surroundings and has a playful nature.",
      "species": "cat",
      "imageURL": "https://www.thisiscolossal.com/wp-content/uploads/2022/07/vogelsang-1.jpg",
      "sex": "male",
      "color": "orange"
    })
  ];
}

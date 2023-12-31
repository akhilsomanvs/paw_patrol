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
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2018/04/close-up-kitten.jpg",
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
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2020/03/cat-photography-fun.jpg",
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
      "imageURL": "https://expertphotography.b-cdn.net/wp-content/uploads/2020/03/cat-photography-yawn.jpg",
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
      "imageURL": "https://images.pexels.com/photos/10188725/pexels-photo-10188725.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
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
    }),
    PetEntity.fromJson(const {
      "id": 31,
      "name": "Ruby",
      "age": 3,
      "price": 90,
      "character": "Ruby is a playful and friendly dog. She loves running in the park and playing fetch with her favorite toy.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1579731339862-TKBNEE4YE6M97QKGDUAD/chapter_giggles-1681-Edit.jpg?format=750w",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 32,
      "name": "Misty",
      "age": 2,
      "price": 50,
      "character": "Misty is a curious and independent cat. She enjoys exploring her surroundings and napping in cozy spots.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/04/Cat-Photography-by-Mark-Hewitson-Photography-Thame-Oxfordshire-3-600x480.jpg",
      "sex": "female",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 33,
      "name": "Nemo",
      "age": 1,
      "price": 25,
      "character": "Nemo is a vibrant and active fish. He loves swimming among colorful coral and exploring the ocean floor.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-10.jpg",
      "sex": "male",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 34,
      "name": "Cocoa",
      "age": 1,
      "price": 75,
      "character": "Cocoa is a friendly and playful rabbit. She enjoys hopping around and nibbling on fresh greens.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2020/04/GettyImages-694542042-e1586274805503-scaled.jpg?resize=768,513",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 35,
      "name": "Rocky",
      "age": 5,
      "price": 150,
      "character": "Rocky is an adventurous and loyal dog. He loves going on long hikes and exploring the great outdoors.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1577151939934-KQWV0Q7ZKGQZ17OUOU1W/border-terrier-dog-catching-treat.jpg?format=750w",
      "sex": "male",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 36,
      "name": "Luna",
      "age": 2,
      "price": 60,
      "character": "Luna is a graceful and affectionate cat. She enjoys lounging by the window and observing the world outside.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-4-600x600.jpg",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 37,
      "name": "Bubbles",
      "age": 2,
      "price": 40,
      "character": "Bubbles is a friendly and sociable goldfish. She loves swimming with other fish and exploring her tank.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-02.jpg",
      "sex": "female",
      "color": "gold"
    }),
    PetEntity.fromJson(const {
      "id": 38,
      "name": "Hazel",
      "age": 1,
      "price": 70,
      "character": "Hazel is a playful and curious rabbit. She enjoys hopping around and digging in her burrow.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2020/04/GettyImages-153016104-e1586356775279-scaled.jpg?resize=768,512",
      "sex": "female",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 39,
      "name": "Charlie",
      "age": 4,
      "price": 120,
      "character": "Charlie is an energetic and intelligent dog. He loves learning new tricks and going for long runs.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1610407127560-M1Z8U6J5AL9IO1AM9KMX/poodel_black_tongue_out_close_up.jpg?format=750w",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 40,
      "name": "Milo",
      "age": 1,
      "price": 55,
      "character": "Milo is a mischievous and playful cat. He loves chasing toy mice and climbing up high surfaces.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-3-600x600.jpg",
      "sex": "male",
      "color": "tabby"
    }),
    PetEntity.fromJson(const {
      "id": 41,
      "name": "Goldie",
      "age": 2,
      "price": 30,
      "character": "Goldie is a cheerful and lively goldfish. She brings color and joy to any aquarium she swims in.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-01.jpg",
      "sex": "female",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 42,
      "name": "Buddy",
      "age": 2,
      "price": 90,
      "character": "Buddy is a friendly and loyal dog. He enjoys playing fetch and going for long walks with his human companion.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1577151944821-RPV4DFG5LDKGEJAXRJFS/British-bulldog-white-portrait--underbite.jpg?format=750w",
      "sex": "male",
      "color": "golden"
    }),
    PetEntity.fromJson(const {
      "id": 43,
      "name": "Mittens",
      "age": 3,
      "price": 60,
      "character": "Mittens is a graceful and independent cat. She enjoys exploring her surroundings and sunbathing by the window.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-8-600x480.jpg",
      "sex": "female",
      "color": "black and white"
    }),
    PetEntity.fromJson(const {
      "id": 44,
      "name": "Coral",
      "age": 1,
      "price": 25,
      "character": "Coral is a colorful and lively fish. She adds vibrancy and beauty to any aquarium.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-04.jpg",
      "sex": "female",
      "color": "purple"
    }),
    PetEntity.fromJson(const {
      "id": 45,
      "name": "Oliver",
      "age": 2,
      "price": 80,
      "character": "Oliver is a friendly and playful rabbit. He loves hopping around and enjoys gentle head rubs.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-476744133-scaled.jpg?resize=696,463",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 46,
      "name": "Daisy",
      "age": 5,
      "price": 150,
      "character": "Daisy is a gentle and loving dog. She enjoys spending time with her family and going for leisurely walks.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1651854393333-3KKWXLZLKIPT8SV5PJ1L/english-bulldog-portrait-vancouver.jpg?format=750w",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 47,
      "name": "Whiskers",
      "age": 2,
      "price": 60,
      "character": "Whiskers is a curious and playful cat. He loves chasing laser pointers and lounging in sunny spots.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-5-600x600.jpg",
      "sex": "male",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 48,
      "name": "Nemo Jr.",
      "age": 1,
      "price": 30,
      "character": "Nemo Jr. is a lively and colorful fish. He adds charm and liveliness to any aquarium.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-05.jpg",
      "sex": "male",
      "color": "blue"
    }),
    PetEntity.fromJson(const {
      "id": 49,
      "name": "Hopper",
      "age": 2,
      "price": 70,
      "character": "Hopper is an energetic and curious rabbit. He loves exploring his surroundings and hopping in wide open spaces.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-1161350775-scaled.jpg?resize=696,464",
      "sex": "male",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 50,
      "name": "Bella",
      "age": 4,
      "price": 120,
      "character": "Bella is a loving and loyal dog. She enjoys cuddling and going on long walks with her human companion.",
      "species": "dog",
      "imageURL":
          "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1577151974328-M5MG3HLISP2I33MI0E9F/hungarian-puli-black-grey-tongue-out-portrait-photography-studio.jpg?format=1000w",
      "sex": "female",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 51,
      "name": "Misty",
      "age": 2,
      "price": 60,
      "character": "Misty is a graceful and elegant cat. She loves lounging on comfortable surfaces and being admired.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-6-600x600.jpg",
      "sex": "female",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 52,
      "name": "Finley",
      "age": 1,
      "price": 25,
      "character": "Finley is a lively and curious fish. He enjoys exploring his aquarium and swimming among vibrant plants.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-06.jpg",
      "sex": "male",
      "color": "red"
    }),
    PetEntity.fromJson(const {
      "id": 53,
      "name": "Coco",
      "age": 1,
      "price": 70,
      "character": "Coco is a playful and energetic rabbit. She loves hopping around and enjoys playing with her favorite toys.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2020/04/GettyImages-492362561-e1586268905784-scaled.jpg?resize=768,512",
      "sex": "female",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 54,
      "name": "Max",
      "age": 3,
      "price": 110,
      "character": "Max is a friendly and active dog. He enjoys playing fetch and going for runs in the park.",
      "species": "dog",
      "imageURL": "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1598555151631-507ZKCS3EHW5XR1DD7B0/Pitbull_brown_white_full_body_portrait_photography.jpg?format=750w",
      "sex": "male",
      "color": "brown"
    }),
    PetEntity.fromJson(const {
      "id": 55,
      "name": "Luna",
      "age": 2,
      "price": 60,
      "character": "Luna is a gentle and affectionate cat. She loves cuddling and being a companion to her human friends.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/04/Cat-Photography-by-Mark-Hewitson-Photography-7-600x480.jpg",
      "sex": "female",
      "color": "gray"
    }),
    PetEntity.fromJson(const {
      "id": 56,
      "name": "Bubbles",
      "age": 1,
      "price": 30,
      "character": "Bubbles is a vibrant and lively fish. He adds color and joy to any aquarium he swims in.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-07.jpg",
      "sex": "male",
      "color": "orange"
    }),
    PetEntity.fromJson(const {
      "id": 57,
      "name": "Cotton",
      "age": 2,
      "price": 80,
      "character": "Cotton is a friendly and playful rabbit. He enjoys hopping around and being a cuddly companion.",
      "species": "rabbit",
      "imageURL": "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-915092866-scaled.jpg?resize=696,696",
      "sex": "male",
      "color": "white"
    }),
    PetEntity.fromJson(const {
      "id": 58,
      "name": "Bailey",
      "age": 4,
      "price": 120,
      "character": "Bailey is a loyal and intelligent dog. She enjoys learning new tricks and being a reliable companion.",
      "species": "dog",
      "imageURL":
          "https://images.squarespace-cdn.com/content/v1/5c336783f2e6b11a9d3b5693/1623525707890-BD5SHVA680PAC1F4OP35/doberman-pinscher-portrait-photo-by-jane-thomson-photography-dog-in-vancouver.jpg?format=750w",
      "sex": "female",
      "color": "golden"
    }),
    PetEntity.fromJson(const {
      "id": 59,
      "name": "Whiskers",
      "age": 1,
      "price": 50,
      "character": "Whiskers is a curious and playful cat. He loves exploring new places and chasing after toys.",
      "species": "cat",
      "imageURL": "https://markhewitson.photography/wp-content/uploads/2020/11/Cat-Photography-by-Mark-Hewitson-Photography-1-600x480.jpg",
      "sex": "male",
      "color": "black"
    }),
    PetEntity.fromJson(const {
      "id": 60,
      "name": "Sunny",
      "age": 2,
      "price": 35,
      "character": "Sunny is a bright and lively fish. He adds warmth and color to any aquarium.",
      "species": "fish",
      "imageURL": "https://inspgr.id/app/uploads/2013/11/fish-photography-03.jpg",
      "sex": "male",
      "color": "yellow"
    }),
  ];
}

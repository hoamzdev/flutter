class LocationModel {
  String image;
  String name;
  String address;
  int price;
  double rating;
  String temperature;
  int time;
  String description;
  bool isMark = false;
  String id;

  LocationModel({
    required this.id,
    required this.image,
    required this.name,
    required this.address,
    required this.price,
    required this.description,
    required this.rating,
    required this.temperature,
    required this.time,
  });
}

List<LocationModel> locationItems = [
  LocationModel(
    id: '0',
    image: "assets/images/theway.png",
    name: 'The Way',
    address: 'Spain',
    price: 1350,
    rating: 5.0,
    temperature: '19°C',
    time: 5,
    description:
        '"The Way" typically refers to the Camino de Santiago, a network of pilgrimage routes leading to the shrine of the apostle Saint James the Great in the Cathedral of Santiago de Compostela in Galicia, northwest Spain.',
  ),
  LocationModel(
    id: '1',
    image: "assets/images/thebridge.png",
    name: 'Loygavegur',
    address: 'Iceland',
    price: 2350,
    rating: 4.9,
    temperature: '1°C',
    time: 15,
    description:
        "Iceland's nature is renowned for its raw and untamed beauty, characterized by dramatic landscapes shaped by volcanic activity, glaciers, geysers, and cascading waterfalls,if you want to enjoy more then you need to visit this all place.",
  ),
  LocationModel(
    id: '2',
    image: "assets/images/sunrise.png",
    name: 'Biển vô cực',
    address: 'Thái Bình',
    price: 3250,
    rating: 5.0,
    temperature: '23°C',
    time: 9,
    description:
        'Oyo Lake, nestled in a picturesque setting, captivates visitors with its tranquil waters and surrounding lush landscapes. It serves as a haven for relaxation and outdoor activities, offering opportunities for boating,and peaceful walks along its shores',
  ),
  LocationModel(
    id: '3',
    image: "assets/images/sunrises.png",
    name: 'Sun Rise',
    address: 'UK',
    price: 3500,
    rating: 4.0,
    temperature: '30°C',
    time: 6,
    description:
        "At dawn, the Eiffel Tower in Paris becomes a spectacle of beauty as the sun rises behind its iconic silhouette, casting a warm glow over the cityscape.If you want to enjoy more then you need to visit this all place.",
  ),
  LocationModel(
    id: '4',
    image: "assets/images/eiffel_tower.png",
    name: 'Effiel Tower',
    address: 'Paris France',
    price: 3350,
    rating: 4.5,
    temperature: '25°C',
    time: 2,
    description:
        ' This enchanting moment draws crowds to witness the breathtaking scene and symbolizes the timeless allure and romantic charm of the French capital, making it an unforgettable experience for visitors from around the world.',
  ),
];

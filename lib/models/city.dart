class City{
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City({required this.isSelected, required this.city, required this.country, required this.isDefault});

  //List of Cities data
  static List<City> citiesList = [
    City(
        isSelected: false,
        city: 'Kathmandu',
        country: 'Nepal',
        isDefault: true),
    City(
        isSelected: false,
        city: 'Butwal',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Delhi',
        country: 'India',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Beijing',
        country: 'China',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Paris',
        country: 'Paris',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Rome',
        country: 'Italy',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Syangja',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Amsterdam',
        country: 'Netherlands',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Barcelona',
        country: 'Spain',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Miami',
        country: 'United States',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Nepal',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Bhairawa',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Gorkha',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Parsa',
        country: 'Nepal',
        isDefault: false),
    City(
        isSelected: false,
        city: 'Chitwan',
        country: 'Nepal',
        isDefault: false),
  ];

  //Get the selected cities
  static List<City> getSelectedCities(){
    List<City> selectedCities = City.citiesList;
    return selectedCities
        .where((city) => city.isSelected == true)
        .toList();
  }
}























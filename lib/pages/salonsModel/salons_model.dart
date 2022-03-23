import 'package:google_maps_flutter/google_maps_flutter.dart';

class Salons {
  String image;
  String salonName;
  String address;
  String rating;
  String reviews;
  bool isFavorite;
  LatLng locationCoords;

  Salons(
      {this.image,
      this.salonName,
      this.address,
      this.rating,
      this.reviews,
      this.isFavorite,
      this.locationCoords});
}

final List<Salons> nearbySalonList = [
  Salons(
    image: 'assets/salon/salon2.png',
    salonName: 'Crown salon',
    address: 'A 9/a Sector 16,Gautam Budh Nagar',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.745803, -73.988213),
  ),
  Salons(
    image: 'assets/salon/salon3.png',
    salonName: 'RedBox salon',
    address: 'A 9/a Sector 16,Gautam Budh Nagar',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.730148, -73.999639),
  ),
  Salons(
    image: 'assets/salon/salon4.png',
    salonName: 'Ultra unisex salon',
    address: 'A 9/a Sector 16,Gautam Budh Nagar',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.721622, -74.004308),
  ),
  Salons(
    image: 'assets/salon/salon5.png',
    salonName: 'Livestyle Salon',
    address: 'A 9/a Sector 16,Gautam Budh Nagar',
    rating: '4.6',
    reviews: '100',
    isFavorite: false,
    locationCoords: const LatLng(40.751908, -73.989804),
  ),
];

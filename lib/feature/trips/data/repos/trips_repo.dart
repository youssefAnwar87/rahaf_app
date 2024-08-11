import 'package:dartz/dartz.dart';
import 'package:rahaf/feature/trips/data/models/buildings_model.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';

abstract class TripsRepo {
  Future<Either<String, BuildingsModel>> getAllBuildings(String location);
  Future<Either<String, HotelProfileModel>> getBuildingById(String id);

}

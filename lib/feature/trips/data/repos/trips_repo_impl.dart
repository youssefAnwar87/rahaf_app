import 'package:dartz/dartz.dart';
import 'package:rahaf/core/error/execute_and_handle_error.dart';
import 'package:rahaf/feature/trips/data/datasources/api_service_trips.dart';
import 'package:rahaf/feature/trips/data/models/buildings_model.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
import 'package:rahaf/feature/trips/data/repos/trips_repo.dart';

class TripsRepoImpl implements TripsRepo {
  final ApiServiceTrips apiServiceTrips;

  TripsRepoImpl(this.apiServiceTrips);

  @override
  Future<Either<String, BuildingsModel>> getAllBuildings(
      String location) async {
    return executeAndHandleError<BuildingsModel>(() async {
      final res = await apiServiceTrips.getAllBuildings(location);
      return res;
    });
  }

  @override
  Future<Either<String, HotelProfileModel>> getBuildingById(String id) {
    return executeAndHandleError<HotelProfileModel>(() async {
      final res = await apiServiceTrips.getBuildingById(id);
      return res;
    });
  }
}

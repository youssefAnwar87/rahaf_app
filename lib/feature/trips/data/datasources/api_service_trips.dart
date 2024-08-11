import 'package:rahaf/core/error/execute_and_handle_error.dart';
import 'package:rahaf/core/shared/usecases/server_config.dart';
import 'package:rahaf/feature/trips/data/models/buildings_model.dart';

import '../../../../core/shared/datasources/remote/api_base.dart';

class ApiServiceTrips extends ApiBase {
  Future<BuildingsModel> getAllBuildings(String location) async {
    return executeAndHandleErrorServer<BuildingsModel>(() async {
      final response = await get(
        "${ServerConfig.buildings}?location=$location&fields=name,imageCover,ratingsAverage,ratingsQuantity",
        // headers: {'authorization': ServerConfig.token},
      );
      if (response.statusCode == 200) {
        try {
          return BuildingsModel.fromJson(response.json);
        } catch (e) {
          rethrow;
        }
      } else {
        throw Exception;
      }
    });
  }
}

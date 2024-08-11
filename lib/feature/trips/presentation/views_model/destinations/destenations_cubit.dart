import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/feature/trips/data/models/buildings_model.dart';
import 'package:rahaf/feature/trips/data/repos/trips_repo.dart';

part 'destenations_state.dart';

class DestenationsCubit extends Cubit<DestenationsState> {
  DestenationsCubit(this._tripsRepo) : super(DestenationsInitial());

  final TripsRepo _tripsRepo;

  static DestenationsCubit get(context) => BlocProvider.of(context);

  final List<String> images = [
    AppAssets.alex,
    AppAssets.marsa,
    AppAssets.dahab,
    AppAssets.hurghada,
    AppAssets.sharm,
    AppAssets.sokhna,
  ];
  final List<String> titles = [
    'Alexandria',
    'Marsa Matrouh',
    'Dahab',
    'El Hurghada',
    'Sharm El sheikh',
    'El Ain Shokhna',
  ];

  final List<String> requests = [
    "alexandria-اسكندرية",
    "marsa matrouh-مرسي مطروح",
    "dahab-دهب",
    "hurghada-الغردقة",
    "sharm el-sheikh-شرم الشيخ",
    "elsokhna-السخنة",
  ];

  List<HotelsData>? hotels;
  void getAllBuilding(int locationIndex) async {
    emit(HotelLoadingState());
    var res = await _tripsRepo.getAllBuildings(requests[locationIndex]);
    res.fold((l) {
      emit(HotelErrorState());
    }, (r) {
      hotels = r.data;
      emit(HotelSuccessState());
    });
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahaf/core/theme/app_assets.dart';
import 'package:rahaf/feature/trips/data/models/buildings_model.dart';
import 'package:rahaf/feature/trips/data/models/hotel_profile_model.dart';
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
    AppAssets.fayoum
  ];
  final List<String> titles = [
    'Alexandria',
    'Marsa Matrouh',
    'Dahab',
    'El Hurghada',
    'Sharm El sheikh',
    'El Ain Shokhna',
    'El Fayoum',
  ];

  final List<String> requests = [
    "alexandria-اسكندرية",
    "marsa matrouh-مرسي مطروح",
    "dahab-دهب",
    "hurghada-الغردقة",
    "sharm el-sheikh-شرم الشيخ",
    "elsokhna-السخنة",
    "Elfayoum-الفيوم"

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

  HotelProfileModel? hotelProfileModel;
  void getBuildingById(String id) async {
    emit(HotelProfileLoadingState());
    var res = await _tripsRepo.getBuildingById(id);
    res.fold((l) {
      emit(HotelProfileErrorState());
    }, (r) {
      hotelProfileModel = r;

      emit(HotelProfileSuccessState());
    });
  }

  int _currentPage = 0;
  Timer? _timer;
  PageController pageController = PageController();

  void startAutoPlay(int length) {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < length - 1) {
        _currentPage++;
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        _currentPage = 0;
        pageController.jumpToPage(_currentPage);
      }
    });
  }

  void stopAutoPlay() {
    _timer?.cancel();
  }

  void disposeAll() {
    stopAutoPlay();
    _currentPage = 0;
  }
}

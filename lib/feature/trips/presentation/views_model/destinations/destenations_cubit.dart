import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahaf/core/theme/app_assets.dart';

part 'destenations_state.dart';

class DestenationsCubit extends Cubit<DestenationsState> {
  DestenationsCubit() : super(DestenationsInitial());

  static DestenationsCubit get(context) => BlocProvider.of(context);

  final List<String> images = [
    AppAssets.alex,
    AppAssets.dahab,
    AppAssets.alex,
    AppAssets.dahab,
    AppAssets.sokhna,
    AppAssets.fayoum,

  ];
  final List<String> titles = [
    'Alexandria',
    'Dahab',
    'Luxor',
    'Sharm El sheikh',
    'El Ain Shokhna',
    'El Fayoum',

  ];
}

part of 'destenations_cubit.dart';

sealed class DestenationsState {}

final class DestenationsInitial extends DestenationsState {}

final class HotelLoadingState extends DestenationsState {}


final class HotelErrorState extends DestenationsState {}


final class HotelSuccessState extends DestenationsState {}


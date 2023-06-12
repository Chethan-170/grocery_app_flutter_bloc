part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

@immutable
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingSuccessState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

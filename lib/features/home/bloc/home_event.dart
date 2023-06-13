part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel product;

  HomeProductWishlistButtonClickedEvent({required this.product});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel product;

  HomeProductCartButtonClickedEvent({required this.product});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

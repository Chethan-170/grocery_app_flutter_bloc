import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickedEvent>(
        _homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(
        _handleHomeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(_handleHomeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(_handleHomeCartButtonNavigateEvent);
  }

  FutureOr<void> _homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
  }

  FutureOr<void> _handleHomeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Clicked');
  }

  FutureOr<void> _handleHomeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('wishlist');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> _handleHomeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('cart button');
    emit(HomeNavigateToCartPageActionState());
  }
}

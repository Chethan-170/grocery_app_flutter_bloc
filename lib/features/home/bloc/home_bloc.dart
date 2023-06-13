import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_flutter_bloc/data/cart_items.dart';
import 'package:grocery_app_flutter_bloc/data/grocery_data.dart';
import 'package:grocery_app_flutter_bloc/data/wishlist_items.dart';
import 'package:grocery_app_flutter_bloc/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_handleHomeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        _homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(
        _handleHomeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(_handleHomeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(_handleHomeCartButtonNavigateEvent);
  }

  FutureOr<void> _handleHomeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try {
      List<ProductDataModel> products = GroceryData.groceryProducts
          .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                desc: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ))
          .toList();
      emit(
        HomeLoadedSuccessState(
          products: products,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.product);
    emit(HomeProductAddedToWishlistActionState());
  }

  FutureOr<void> _handleHomeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.product);
    emit(HomeProductAddedToCartActionState());
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

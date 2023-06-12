import 'package:flutter/material.dart';
import 'package:grocery_app_flutter_bloc/features/cart/ui/cart.dart';
import 'package:grocery_app_flutter_bloc/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_flutter_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Wishlist()),
          );
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Grocery App'),
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
                },
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeCartButtonNavigateEvent());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              )
            ],
          ),
        );
      },
    );
  }
}

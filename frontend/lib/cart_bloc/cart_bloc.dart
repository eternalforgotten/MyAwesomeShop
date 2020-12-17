import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shop/entities/cart.dart';
import 'package:shop/repos/user_repository.dart';
import 'package:shop/services/requests.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartUpdateState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddEvent) {
      await Requests.addProduct(event.id);
      UserRepository.cart = await Requests.getCart();
      yield CartUpdateState();
    }
    if (event is RemoveEvent) {
      await Requests.removeProduct(event.id);
      UserRepository.cart = await Requests.getCart();
      yield CartUpdateState();
    }
    if (event is DeleteEvent) {
      await Requests.deleteProduct(event.id);
      UserRepository.cart = await Requests.getCart();
      yield CartUpdateState();
    }
  }
}

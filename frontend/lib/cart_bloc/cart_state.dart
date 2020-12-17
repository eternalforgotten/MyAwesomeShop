part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdateState extends CartState {}

class CartLoadingState extends CartState {}

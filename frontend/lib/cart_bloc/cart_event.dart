part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddEvent extends CartEvent {
  final String id;

  AddEvent(this.id);
}
class RemoveEvent extends CartEvent {
  final String id;

  RemoveEvent(this.id);
}
class DeleteEvent extends CartEvent {
  final String id;

  DeleteEvent(this.id);
}

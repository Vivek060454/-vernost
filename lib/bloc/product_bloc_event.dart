import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
@immutable
abstract class ProductEvent extends Equatable{
  const ProductEvent();
  @override
  List<Object?> get props =>[];
}
class getdataEvent extends ProductEvent{
  @override
  List<Object?> get props =>[];
}
import 'package:equatable/equatable.dart';
class UserEntity extends Equatable{
final String ? userId;
final String name;
final String email;
final String password;
final String phoneNumber;

const UserEntity({
  this.userId,
  required this.name,
  required this.email,
  required this.password,
  required this.phoneNumber,
});

@override
  List<Object?> get props => [userId,name,email,password,phoneNumber];

}
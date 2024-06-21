import 'package:equatable/equatable.dart';
class UserEntity extends Equatable{
final String ? userId;
final String username;
final String email;
final String password;
final String ? profilePicture;

const UserEntity({
  this.userId,
  required this.username,
  required this.email,
  required this.password,
  this.profilePicture
});

@override
  List<Object?> get props => [userId,username,email,password,profilePicture];

}
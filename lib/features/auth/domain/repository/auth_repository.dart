import 'dart:io';

import 'package:trailtrekker_app/features/auth/data/repository/auth_local_repository.dart';
import 'package:trailtrekker_app/features/auth/data/repository/auth_remote_repository.dart';
import 'package:trailtrekker_app/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';

final authRepositoryProvider=Provider((ref){
  return ref.read(authRemoteRepositoryProvider);
});


abstract class IAuthRepository{
  Future<Either<Failure,bool>> registerUser(UserEntity user);
  Future<Either<Failure,bool>> loginUser(String email,String password);
  Future<Either<Failure,String>> uploadProfilePicture(File file);
}


import 'package:hive_flutter/hive_flutter.dart';
import 'package:trailtrekker_app/app/constants/hive_table_constant.dart';
import 'package:trailtrekker_app/features/auth/domain/entity/user_entity.dart';
import 'package:uuid/uuid.dart';
import 'package:riverpod/riverpod.dart';
part 'register_hive_model.g.dart';
final authHiveModelProvider=Provider((ref)=>UserHiveModel.empty(),);

@HiveType(typeId:HiveTableConstant.userTableId)
class UserHiveModel{
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String phoneNumber;






  UserHiveModel({
    String ? userId,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
}):userId=userId ?? const Uuid().v4();

  UserHiveModel.empty():this(
    userId: '',
    name: '',
    email: '',
    password: '',
    phoneNumber: ''
  );


  //convert hive object to Entity
 UserEntity toEntity()=>UserEntity(userId:userId,name: name, email:email , password:  password, phoneNumber: phoneNumber);

 //convert Entity to Hive Database
UserHiveModel toUserModel(UserEntity entity)=>UserHiveModel(userId: const Uuid().v4(),name: entity.name, email: entity.email, password: entity.password, phoneNumber: entity.phoneNumber);
//convert Entity List to Hive List
List<UserHiveModel> toUserModelList(List<UserEntity> entities)=>
    entities.map((entity)=>toUserModel(entity)).toList();

@override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }

}

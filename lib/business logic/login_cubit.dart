import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/business%20logic/state_logincubit.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(Initialstate());
  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? model;

  void Register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(LoadingRegisterShopAppState());
    emit(SuccessfulyRegisterShopAppState(model));
  }

  void UseLogin({var email, var password}) {
    emit(LoadingLoginShopAppState());
    CachHelper.SaveData(value: 'token', key: 'token');
    emit(SuccessfulyLoginShopAppState(model));
  }

  late Database database;
  void createDataBase() async {
    await openDatabase('user.db', version: 1, onCreate: (database, version) {
      print('ceate database');
      database
          .execute(
              'CREATE TABLE tasks( id INTEGER PRIMARY KEY, phone TEXT,name TEXT, email TEXT )')
          .then((value) {});
    }, onOpen: (database) {
      print('opendatabase');
    }).then((value) {
      database = value;
      getDataBase(database);
    });
    emit(createDataBaseState());
  }

  insertDataBase({
    @required String? phone,
    @required String? name,
    @required String? email,
  }) {
    database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks ( phone,name,email) VALUES(" $phone","$name","$email")');
    }).then((value) {
      print('$value insert successfuly');
      getDataBase(database);
      emit(InsertDataBaseState());
    }).catchError((onError) {
      print('error when insert alaa${onError.toString()}');
    });
  }

  var phone;
  var name;
  Map<dynamic, dynamic> user = {};
  getDataBase(Database database) {
    emit(LodingState());

    database.rawQuery('SELECT* FROM tasks').then((value) {
      user.addAll(value[0]);

      print('${user}اهووو');

      phone = user['phone'] ?? '010933867';
      name = user['name'] ?? 'alaa';

      emit(GetDataBaseState());
    }).catchError((onError) {
      print('error when gget alaa${onError.toString()}');
    });
  }

  DeletData({
    required var id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataBase(database);
      emit(DleteDataBaseState());
    });
  }
}

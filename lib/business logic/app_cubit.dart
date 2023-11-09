import 'dart:convert';
import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/business%20logic/app_states.dart';
import 'package:flutter_application_1/business%20logic/login_cubit.dart';
import 'package:flutter_application_1/models/card_model.dart';
import 'package:flutter_application_1/models/dummy_data.dart';
import 'package:flutter_application_1/models/order_model.dart';
import 'package:flutter_application_1/presentation/home_screen/archive_screen.dart';
import 'package:flutter_application_1/presentation/home_screen/home_screen.dart';
import 'package:flutter_application_1/presentation/auth_screens/login_image.dart';
import 'package:flutter_application_1/presentation/order_screens/order_screen.dart';
import 'package:flutter_application_1/presentation/profile_screen.dart';
import 'package:flutter_application_1/presentation/auth_screens/regester_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCubit extends Cubit<CubitState> {
  AppCubit() : super(Initialstate());
  static AppCubit get(context) => BlocProvider.of(context);
  int? index = 0;
  int quantity = 0;
  Popular? popular;

  void Chandepadge(int? indexx) {
    index = indexx;
    emit(ChangePadgeState());
  }

  void ChangeQuantity(
    bool increment,
  ) {
    if (increment) {
      quantity = ChickQuantity(
        quantity + 1,
      );
    } else {
      quantity = ChickQuantity(
        quantity - 1,
      );
    }

    emit(ChangeQuantityState());
  }

  int? Number(int id) {
    if (Items.containsKey(id)) {
      if (Items[id]!.quantity! + quantity < 20) {
        return Items[id]!.quantity! + quantity;
      } else if (Items[id]!.quantity! + quantity < 0) {
        return 0;
      } else {
        return 20;
      }
    } else {
      return quantity;
    }
  }

  void DecreaseNumber(int id) {
    if (Items.containsKey(id)) {
      items.update(
          id,
          (value) => CardItem(
                id: value.id,
                img: value.img,
                isExit: true,
                name: value.name,
                price: value.price,
                time: DateTime.now().toString(),
                quantity: (value.quantity!) - 1 > 0 ? (value.quantity!) - 1 : 0,
              ));

      if (items[id]!.quantity! <= 0) {
        items.remove(id);
        CachHelper.removeData(key: 'Cart-List');

        AddToCartList(getItem);
      }
      quantity = 0;
    }
  }

  void IncreaseNumber(int id) {
    if (Items.containsKey(id)) {
      items.update(
          id,
          (value) => CardItem(
                id: value.id,
                img: value.img,
                isExit: true,
                name: value.name,
                price: value.price,
                time: DateTime.now().toString(),
                quantity:
                    (value.quantity!) + 1 < 20 ? (value.quantity!) + 1 : 20,
              ));

      quantity = 0;
    }
  }

  int? get TotalQuantity {
    var total = 0;
    items.forEach((key, value) {
      total += value.quantity!;
    });
    return total;
  }

  int ChickQuantity(
    int quantityy,
  ) {
    if (quantityy > 20) {
      SnackBar(
        content: Container(
          height: 50.h,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(text: 'Item count', color: ColorManage.white),
              SmallText(
                  text: 'You can\'nt add more!', color: ColorManage.white),
            ],
          ),
        ),
      );
      return 20;
    } else if (quantityy < 0) {
      SnackBar(
        content: Container(
          color: ColorManage.Primary,
          height: 50.h,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(text: 'Item count', color: ColorManage.white),
              SmallText(
                  text: 'You can\'nt reduce more!', color: ColorManage.white),
            ],
          ),
        ),
      );

      return 0;
    } else {
      return quantityy;
    }
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    const BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'history'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), label: 'cart'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'me'),
  ];
  List<Widget> screens = [
    const HomeView(),
    OrderScreen(),
    const ArchiveView(),
    // Profile()
    ConditionalBuilder(
      condition: LoginCubit().user != null,
      builder: (context) {
        return const Profile();
      },
      fallback: (context) {
        return const LoginImage();
      },
    )
  ];
  List<OrderModel>? currentOrder;
  List<OrderModel>? historyOrder;
  List<OrderModel>? get getcurruntOrderList => currentOrder;
  List<OrderModel>? get gethistoryList => historyOrder;

  Future<void> getOrder() async {
    currentOrder = [];
    historyOrder = [];
    emit(GetOrderLoadingState());

    data.forEach((element) {
      OrderModel orderModel = OrderModel.fromJson(element);
      orderModel.status == 'pending' || orderModel.status == 'accepted'
          ? currentOrder!.add(orderModel)
          : historyOrder!.add(orderModel);
    });
    emit(GetOrderSuccessState());
  }

  void changeBottonNav(int index) {
    currentIndex = index;

    emit(ChangeBottomNaveState());
  }

  List<CardItem> get getItem {
    return items.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<List<CardItem>> get gethistory {
    return ItemPerOrder!.entries.map((e) {
      return e.value;
    }).toList();
  }

  double? get Total {
    double total = 0;

    items.forEach((key, value) {
      total += (value.quantity! * value.price!);
    });

    return total;
  }

  void indexPadge(int index, String name) {
    number.putIfAbsent(name, () => index);
    print(number);
  }

  int? padgnumber(int index) {
    int? numberr = number.containsKey(getItem[index].name)
        ? number[getItem[index].name]
        : 0;
    return numberr;
  }

  void GetPopular() {
    emit(PopularLoadihgState());

    DioHelper.Getdetails().then((value) {
      popular = Popular.fromJson(value.data);
      emit(PopularSuccessState());
    }).catchError((Error) {
      emit(PopularErrorState());
    });
  }

  Map<int, CardItem> items = {};
  Map<String, int> number = {};

  void AddItem(
    Map<String, dynamic> e,
  ) {
    if (quantity != 0) {
      if (items.containsKey(e['id'])) {
        items.update(
            e['id'],
            (value) => CardItem(
                  id: value.id,
                  img: value.img,
                  isExit: true,
                  name: value.name,
                  price: value.price,
                  time: DateTime.now().toString(),
                  quantity: value.quantity! + quantity,
                ));
        quantity = 0;
      } else {
        items.putIfAbsent(
            e['id'],
            () => CardItem(
                  id: e['id'],
                  img: e['image'],
                  isExit: true,
                  name: e['name'],
                  price: e['price'],
                  time: DateTime.now().toString(),
                  quantity: quantity,
                ));
        quantity = 0;
        print('the lenght  ${items.length}');
        emit(AddTocatrtState());
        items.forEach((key, value) {
          print(' kmia  ${value.quantity}');
        });
      }
    } else {
      SnackBar(
        content: Container(
          color: ColorManage.Primary,
          height: 50.h,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BigText(text: 'Item count', color: ColorManage.white),
              SmallText(
                  text: 'You Should at least add an item in the cart!',
                  color: ColorManage.white),
            ],
          ),
        ),
      );
    }

    AddToCartList(getItem);
    emit(UpdateHistoryState());
  }

  Map<int, dynamic> get Items => items;

  Widget Img(int index) {
    if ((getItem[index].img! == 'assets/images/food2.jpg') ||
        (getItem[index].img! == 'assets/images/food1.jpg') ||
        (getItem[index].img! == 'assets/images/food3.jpg') ||
        (getItem[index].img! == 'assets/images/food4.jpg') ||
        (getItem[index].img! == 'assets/images/food5.jpg')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: AssetImage(getItem[index].img!),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: NetworkImage(getItem[index].img!),
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget ImgHistory(
    int i,
    int index,
  ) {
    if ((gethistory[i][index].img! == 'assets/images/food2.jpg') ||
        (gethistory[i][index].img! == 'assets/images/food1.jpg') ||
        (gethistory[i][index].img! == 'assets/images/food3.jpg') ||
        (gethistory[i][index].img! == 'assets/images/food4.jpg') ||
        (gethistory[i][index].img! == 'assets/images/food5.jpg')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.all(3.r),
          child: Image(
            image: AssetImage(gethistory[i][index].img!),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: EdgeInsets.all(3.r),
          child: Image(
            image: NetworkImage(gethistory[i][index].img!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Map<String, dynamic> card(int index) {
    Map<String, dynamic> cart = {
      'id': getItem[index].id!,
      'image': getItem[index].img!,
      "name": getItem[index].name!,
      "price": getItem[index].price!,
    };
    return cart;
  }

  List<String> cart = [];
  List<CardItem> history = [];

  void AddToCartList(List<CardItem> cartlist) {
    cart = [];
    cartlist.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    CachHelper.PutListOfString(key: 'Cart-List', value: cart);
    CachHelper.PutListOfString(key: 'history-List', value: cart);
    getCartList();
  }

  String? timeorder;
  List<CardItem> storage = [];

  List<CardItem> getCartData() {
    setCart = getCartList();

    return storage;
  }

  set setCart(List<CardItem> item) {
    storage = item;

    for (int i = 0; i < storage.length; i++) {
      items.putIfAbsent(storage[i].id!, () => storage[i]);
    }
  }

  List<CardItem> getCartList() {
    List<String> getcart = [];
    if (CachHelper.sharedpreferences!.containsKey('Cart-List')) {
      getcart = [];
      getcart = CachHelper.getListOfString(key: 'Cart-List');
    }
    List<CardItem> cartlist = [];
    getcart.forEach((element) {
      cartlist.add(CardItem.fromJson(jsonDecode(element)));
    });

    return cartlist;
  }

  Map<String, List<CardItem>>? ItemPerOrder = {};
  void getHistoryList() {
    List<String> historyString = [];
    history = [];
    if (CachHelper.sharedpreferences!.containsKey('history-List')) {
      historyString = [];
      historyString = CachHelper.getListOfString(key: 'history-List');
    }

    historyString.forEach((element) {
      history.add(CardItem.fromJson(jsonDecode(element)));
    });

    if (timeorder != null) {
      if (ItemPerOrder!.containsKey(timeorder)) {
        ItemPerOrder!.update(timeorder!, (value) => getCartList());
      } else {
        ItemPerOrder!.putIfAbsent(history[0].time!, () => history);
      }
    } else {
      ItemPerOrder!.putIfAbsent(history[0].time!, () => history);
    }

    CachHelper.removeData(key: 'Cart-List');
    items = {};

    emit(DeleteCartState());
  }

  void LogOut(context) {
    CachHelper.removeData(key: 'token');
    items = {};
    ItemPerOrder = {};
    history = [];
    token = '';
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => RegesterView())),
        (route) => true);

    LoginCubit.get(context).DeletData(id: 0);
    LoginCubit.get(context).DeletData(id: 1);
    LoginCubit.get(context).DeletData(id: 2);
    LoginCubit.get(context).DeletData(id: 3);
    LoginCubit.get(context).DeletData(id: 4);
    LoginCubit.get(context).DeletData(id: 5);
    LoginCubit.get(context).DeletData(id: 6);
    LoginCubit.get(context).DeletData(id: 7);
    LoginCubit.get(context).DeletData(id: 8);
    LoginCubit.get(context).DeletData(id: 9);
  }
}

import 'package:expense_tracker_2/data/remote/models/category_data_model.dart';
import 'package:flutter/material.dart';

class Assets {
  static const String splash_screen_img = 'assets/images/splash.png';
  static const String home_screen_image = 'assets/images/img1.png';
  static const String login_screen_image = 'assets/images/login.png';
  static const String expense_tracker_image = 'assets/images/statistics_img.png';
  static const String book_image = 'assets/icons/book.png';
  static const String budget_image = 'assets/icons/budget.png';
  static const String cigerettes_image = 'assets/icons/cigerette.png';
  static const String cloth_image = 'assets/icons/cloth.png';
  static const String coffee_image = 'assets/icons/cloth.png';
  static const String drink_image = 'assets/icons/drink.png';
  static const String electricity_image = 'assets/icons/electricity.png';
  static const String entertainment_image = 'assets/icons/entertainment.png';
  static const String fast_food_image = 'assets/icons/fast-food.png';
  static const String food_image = 'assets/icons/food.png';
  static const String fruite_image = 'assets/icons/fruit.png';
  static const String furniture_image = 'assets/icons/furniture.png';
  static const String gas_image = 'assets/icons/gas.png';
  static const String giftBox_image = 'assets/icons/gift-box.png';
  static const String gift_image = 'assets/icons/gift.png';
  static const String groceries_image = 'assets/icons/groceries.png';
  static const String gym_image = 'assets/icons/gym.png';
  static const String shirt_image = 'assets/icons/hawaiian-shirt.png';
  static const String hot_pot_image = 'assets/icons/hot-pot.png';
  static const String income_image = 'assets/icons/income.png';
  static const String laundry_image = 'assets/icons/laundry.png';
  static const String magazine_image = 'assets/icons/magazine.png';
  static const String makeup_image = 'assets/icons/makeup-pouch.png';
  static const String massage_image = 'assets/icons/massage.png';
  static const String medical_image = 'assets/icons/medical.png';
  static const String mobile_image = 'assets/icons/mobile-transfer.png';
  static const String movie_image = 'assets/icons/movie.png';
  static const String music_image = 'assets/icons/music.png';
  static const String painting_image = 'assets/icons/painting.png';
  static const String parking_image = 'assets/icons/parking.png';
  static const String popcorn_image = 'assets/icons/popcorn.png';
  static const String public_transport_image = 'assets/icons/public-transport.png';
  static const String restaurant_image = 'assets/icons/restaurant.png';
  static const String salon_image = 'assets/icons/salon.png';
  static const String shopping_bag_image = 'assets/icons/shopping-bag.png';
  static const String shopping_cart_image = 'assets/icons/shopping-cart.png';
  static const String smartPhone_image = 'assets/icons/smartphone.png';
  static const String smoking_area = 'assets/icons/smoking-area.png';
  static const String snack_image = 'assets/icons/snack.png';
  static const String tools_image = 'assets/icons/tools.png';
  static const String travel_image = 'assets/icons/travel.png';
  static const String vegetable_image = 'assets/icons/vegetables.png';
  static const String vehicle_image = 'assets/icons/vehicles.png';
  static const String wallet_image = 'assets/icons/wallet.png';
  static const String watch_image = 'assets/icons/watch.png';
  static const String insurance_image = 'assets/icons/insurance.png';
  static const String investment_imge = 'assets/icons/investment.png';
  static const String mortgage_image = 'assets/icons/mortgage.png';
  static const String toy_image = 'assets/icons/toy.png';
  static const String logOut = 'assets/icons/exit.png';
}

class Colour {
  // static const int pageColor = 0xffFFEDE5;
  // static const int buttonColor = 0xffFF671F;
  // static const int placeholderColor = 0xffB3B3B3;
  // static const int componentColor = 0xffFFB799;
  // static const int borderColor = 0xffFFB497;
  static Color componentColor = Colors.cyan.shade300;
  static Color text_color_red = Colors.red.shade300;
  static Color text_color_grey = Colors.grey;
}

class CategoryIcons {
  static List<CategoryDataModel> mCategory = [
    CategoryDataModel(cId: 1, title: 'Parking', imageIcon: Assets.parking_image),
    CategoryDataModel(cId: 2, title: 'Cloth', imageIcon: Assets.cloth_image),
    CategoryDataModel(cId: 3, title: 'Gas', imageIcon: Assets.gas_image),
    CategoryDataModel(cId: 4, title: 'Public transport', imageIcon: Assets.public_transport_image),
    CategoryDataModel(cId: 5, title: 'Music', imageIcon: Assets.music_image),
    CategoryDataModel(cId: 6, title: 'Groceries', imageIcon: Assets.groceries_image),
    CategoryDataModel(cId: 7, title: 'Gym', imageIcon: Assets.gym_image),
    CategoryDataModel(cId: 8, title: 'Income', imageIcon: Assets.income_image),
    CategoryDataModel(cId: 9, title: 'Fast food', imageIcon: Assets.fast_food_image),
    CategoryDataModel(cId: 10, title: 'Laundry', imageIcon: Assets.laundry_image),
    CategoryDataModel(cId: 11, title: 'Gift', imageIcon: Assets.gift_image),
    CategoryDataModel(cId: 12, title: 'Drink', imageIcon: Assets.drink_image),
    CategoryDataModel(cId: 13, title: 'Flight travel', imageIcon: Assets.travel_image),
    CategoryDataModel(cId: 14, title: 'Movie', imageIcon: Assets.movie_image),
    CategoryDataModel(cId: 15, title: 'Fruit', imageIcon: Assets.fruite_image),
    CategoryDataModel(cId: 16, title: 'Massage', imageIcon: Assets.massage_image),
    CategoryDataModel(cId: 17, title: 'Magazine', imageIcon: Assets.magazine_image),
    CategoryDataModel(cId: 18, title: 'Books', imageIcon: Assets.book_image),
    CategoryDataModel(cId: 19, title: 'Medicine', imageIcon: Assets.medical_image),
    CategoryDataModel(cId: 20, title: 'Painting', imageIcon: Assets.painting_image),
    CategoryDataModel(cId: 21, title: 'Salon', imageIcon: Assets.salon_image),
    CategoryDataModel(cId: 22, title: 'Wallet', imageIcon: Assets.wallet_image),
    CategoryDataModel(cId: 23, title: 'Food', imageIcon: Assets.food_image),
    CategoryDataModel(cId: 24, title: 'Shopping', imageIcon: Assets.shopping_cart_image),
    CategoryDataModel(cId: 25, title: 'Snack', imageIcon: Assets.snack_image),
    CategoryDataModel(cId: 26, title: 'Investment', imageIcon: Assets.income_image),
    CategoryDataModel(cId: 27, title: 'Insurance', imageIcon: Assets.insurance_image),
    CategoryDataModel(cId: 28, title: 'Mortgage', imageIcon: Assets.mortgage_image),
    CategoryDataModel(cId: 29, title: 'Toy', imageIcon: Assets.toy_image),
    CategoryDataModel(cId: 30, title: 'Coffee', imageIcon: Assets.coffee_image),
    CategoryDataModel(cId: 31, title: 'Electricity', imageIcon: Assets.electricity_image),
    CategoryDataModel(cId: 32, title: 'Entertainment', imageIcon: Assets.entertainment_image),
    CategoryDataModel(cId: 33, title: 'Room rent', imageIcon: Assets.furniture_image),
    CategoryDataModel(cId: 34, title: 'Cigerettes', imageIcon: Assets.cigerettes_image),
    CategoryDataModel(cId: 35, title: 'Parking', imageIcon: Assets.parking_image),
    CategoryDataModel(cId: 36, title: 'Investment', imageIcon: Assets.investment_imge)
  ];
}
import 'package:azlistview/azlistview.dart';
import 'package:hive/hive.dart';

part 'az_food_list.g.dart';


//declaracion de clase compatible con params de AZListView
@HiveType(typeId: 1)
class AZFoodListItem extends ISuspensionBean {
  @HiveField(0)
  final String tag;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String unit;
  
  @HiveField(3)
  final int baseServingSize;
  
  @HiveField(4)
  final int basecarbs;
  
  @HiveField(5)
  final String description;
  
  @HiveField(6)
  final String imageUrl;

  AZFoodListItem(
      {required this.tag,
      required this.title,
      required this.unit,
      required this.baseServingSize,
      required this.basecarbs,
      required this.description,
      required this.imageUrl});

  @override
  String getSuspensionTag() => tag;
}

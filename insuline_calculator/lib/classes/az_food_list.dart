import 'package:azlistview/azlistview.dart';

//declaracion de clase compatible con params de AZListView
class AZFoodListItem extends ISuspensionBean {
  final String tag;
  final String title;
  final String unit;
  final int baseServingSize;
  final int basecarbs;
  final String description;
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

import 'package:flutter/material.dart';
import 'package:quria/constants/styles.dart';
import 'package:quria/constants/texts.dart';

class CollectionMobileCategories extends StatefulWidget {
  final List<String> categories;
  final String categorySelected;
  const CollectionMobileCategories(
      {Key? key, required this.categorySelected, required this.categories})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CollectionMobileCategories();
}

class _CollectionMobileCategories extends State<CollectionMobileCategories> {
  late String categorySelected;
  @override
  void initState() {
    super.initState();
    categorySelected = 'category 1';
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
        onTap: () => setState(() => categorySelected = 'category 1'),
        child: CategoryWidget(
          categorySelected: categorySelected,
          category: 'category 1',
        ),
      ),
      InkWell(
        onTap: () => setState(() => categorySelected = 'category 2'),
        child: CategoryWidget(
          categorySelected: categorySelected,
          category: 'category 2',
        ),
      ),
      InkWell(
        onTap: () => setState(() => categorySelected = 'category 3'),
        child: CategoryWidget(
          categorySelected: categorySelected,
          category: 'category 3',
        ),
      ),
    ]);
  }
}

class CategoryWidget extends StatefulWidget {
  final String category;
  final String categorySelected;

  const CategoryWidget(
      {Key? key, required this.category, required this.categorySelected})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CategoryWidget();
}

class _CategoryWidget extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.categorySelected == widget.category) {
      return Container(
          width: vw(context) * 0.321,
          height: vh(context) * 0.055,
          decoration: const BoxDecoration(
              color: blackLight,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Container(
              alignment: Alignment.center,
              child: textBodyBold(widget.category)));
    } else {
      return SizedBox(
          width: vw(context) * 0.321,
          height: vh(context) * 0.05,
          child: Container(
              alignment: Alignment.center,
              child: textBodyBold(widget.category)));
    }
  }
}

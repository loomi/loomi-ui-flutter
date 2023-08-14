import 'package:flutter/material.dart';

class CustomTabItens extends StatefulWidget {
  final List<String> items;
  final BoxDecoration? backgroundDecoration;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? textSize;
  final double? indicatorWeight;
  final EdgeInsets? padding;
  final Function(int) onIndexChanged;

  const CustomTabItens({
    super.key,
    required this.items,
    this.backgroundDecoration,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.textSize,
    this.padding,
    required this.onIndexChanged,
    this.indicatorWeight,
  });

  @override
  State<CustomTabItens> createState() => _CustomTabItensState();
}

class _CustomTabItensState extends State<CustomTabItens>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.items.length, vsync: this)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          setState(() {
            _currentIndex = _tabController.index;
          });
          widget.onIndexChanged(_currentIndex);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.backgroundDecoration,
      width: MediaQuery.of(context).size.width,
      // height: 40,
      child: Center(
        child: TabBar(
          padding: widget.padding ?? const EdgeInsets.only(top: 12),
          controller: _tabController,
          indicatorColor: widget.selectedTextColor,
          labelColor: widget.selectedTextColor,
          unselectedLabelColor: widget.unselectedTextColor,
          isScrollable: true,
          dividerColor: widget.selectedTextColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: widget.indicatorWeight ?? 2,
          labelStyle: TextStyle(
            fontSize: widget.textSize,
          ),
          tabs: List.generate(
            widget.items.length,
            (index) => TextTabItemComponent(
              text: widget.items[index],
              isSelected: _currentIndex == index,
              selectedTextColor: widget.selectedTextColor,
              unselectedTextColor: widget.unselectedTextColor,
              textSize: widget.textSize,
            ),
          ),
        ),
      ),
    );
  }
}

class TextTabItemComponent extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final double? textSize;
  final EdgeInsets? padding;

  const TextTabItemComponent({
    Key? key,
    required this.text,
    required this.isSelected,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.textSize = 14,
    this.padding,
  }) : super(key: key);

  @override
  State<TextTabItemComponent> createState() => _TextTabItemComponentState();
}

class _TextTabItemComponentState extends State<TextTabItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.isSelected
              ? widget.selectedTextColor ?? Theme.of(context).primaryColor
              : widget.unselectedTextColor ?? Colors.grey,
          fontSize: widget.textSize ?? 14,
          fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}

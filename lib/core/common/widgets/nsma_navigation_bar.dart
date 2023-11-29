import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nesma/core/common/widgets/glass_effect_widget.dart';
import 'package:nesma/core/extension/context_extension.dart';
import 'package:nesma/core/managers/colors/color_manager.dart';
import 'package:nesma/core/managers/icons_manager/icons_manager.dart';
import 'package:nesma/core/managers/size_manager/corner_size.dart';

class NSMANavigationBar extends StatelessWidget {
  final Widget scaffold;
  final NavigationBarController controller;

  const NSMANavigationBar(
      {Key? key, required this.scaffold, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        scaffold,
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(bottom: context.height * 0.03),
            child: GlassEffect(
              borderRadius: CornerSize.s13,
              width: context.width * 0.9,
              height: context.height * 0.08,
              withElevation: true,
              child: Container(
                color: ColorManager.white.withOpacity(0.7),
                child: ValueListenableBuilder<int>(
                    valueListenable: controller,
                    builder: (context, value, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildIcon(IconsManager.home, 0),
                            _buildIcon(IconsManager.offer, 1),
                            _buildIcon(IconsManager.shoppingCart, 2),
                            _buildIcon(IconsManager.person, 3),
                          ],
                        )),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        controller.change(index);
      },
      child: Icon(
        icon,
        color: controller.selectedValue == index
            ? ColorManager.active
            : ColorManager.inactive,
        size: 20,
      ),
    );
  }
}

class NavigationBarController extends ValueNotifier<int> {
  int selectedValue;
  late final PageController _pageController =
      PageController(initialPage: selectedValue);

  PageController get pageController => _pageController;

  void change(int newValue) {
    // _pageController.removeListener(_listenerToPageController);
    selectedValue = newValue;
    _pageController.animateToPage(newValue,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
    notifyListeners();
    // _pageController.addListener(_listenerToPageController);
  }

  void _listenerToPageController() {
    if(_pageController.position.isScrollingNotifier.value==false) {
      if (_pageController.position.userScrollDirection ==
          ScrollDirection.forward) {
        selectedValue = _pageController.page?.floor() ?? 0;
      } else {
        selectedValue = _pageController.page?.ceilToDouble().toInt() ?? 0;
      }
      notifyListeners();
    }
  }

  void _listenToPageController() {
    _pageController.addListener(_listenerToPageController);
  }

  static NavigationBarController instance(value) =>
      NavigationBarController._internal(selectedValue: value);

  NavigationBarController._internal({
    required this.selectedValue,
  }) : super(selectedValue) {
    // _listenToPageController();
  }
}

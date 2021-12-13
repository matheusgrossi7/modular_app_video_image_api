import 'package:flutter/material.dart';

class NothingFoundSliverPlaceholder extends StatelessWidget {
  const NothingFoundSliverPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Text(
          "Nothing found :/",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).unselectedWidgetColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

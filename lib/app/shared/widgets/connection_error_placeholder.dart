import 'package:flutter/material.dart';

class ConnectionErrorPlaceholder extends StatelessWidget {
  const ConnectionErrorPlaceholder({Key? key, required this.refresh})
      : super(key: key);
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Connection error :/",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).unselectedWidgetColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            height: 32,
          ),
          OutlinedButton.icon(
            onPressed: () => refresh(),
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}

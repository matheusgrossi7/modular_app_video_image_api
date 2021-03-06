import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../images_controller.dart';
import '../images_module.dart';

class SearchBarTextField extends StatefulWidget {
  const SearchBarTextField({
    Key? key,
    required this.scrollAnimateToTop,
  }) : super(key: key);
  final Function scrollAnimateToTop;

  @override
  State<SearchBarTextField> createState() => _SearchBarTextFieldState();
}

class _SearchBarTextFieldState extends State<SearchBarTextField> {
  TextEditingController? _textController;
  FocusNode? _focusNode;
  // Temporary workaround, more info in images_module.dart
  ImagesController controller = imagesController;

  void _onTap() {
    widget.scrollAnimateToTop();
  }

  void _onChanged(String string) {
    widget.scrollAnimateToTop();
    controller.setSearchFieldInitialValue(string);
  }

  void _onFieldSubmitted(String value) {
    widget.scrollAnimateToTop();
    controller.search(_textController!.value.text);
  }

  void clearTextFormField() {
    _textController!.clear();
    controller.setSearchFieldInitialValue("");
    _focusNode!.requestFocus();
  }

  @override
  void initState() {
    _textController = TextEditingController(
      text: controller.searchFieldInitialValue,
    );
    _focusNode = controller.focusNode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              focusNode: _focusNode,
              controller: _textController,
              textInputAction: TextInputAction.search,
              onChanged: (String string) => _onChanged(string),
              onTap: _onTap,
              onFieldSubmitted: _onFieldSubmitted,
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          Observer(
            builder: (BuildContext context) => AnimatedOpacity(
              duration: controller.animationsParameters.fadeInDuration,
              opacity: controller.searchFieldInitialValue.isNotEmpty ? 1 : 0,
              child: InkWell(
                onTap: clearTextFormField,
                child: Icon(
                  Icons.cancel,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

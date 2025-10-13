import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldPassCustom extends StatefulWidget {
  const TextFieldPassCustom({
    super.key,
    required this.lable,
    required this.textController,
    this.validate,
  });

  final String lable;
  final TextEditingController textController;
  final String? Function(String?)? validate;

  @override
  State<TextFieldPassCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldPassCustom> {
  bool isTrue = true;
  final FocusNode focus = FocusNode();
  bool isFocus = false;

  void _onchangeFocus() {
    setState(() {
      if (focus.hasFocus) {
        isFocus = true;
      } else {
        isFocus = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus.addListener(_onchangeFocus);
  }

  @override
  void dispose() {
    focus.removeListener(_onchangeFocus);
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.lable, style: Theme.of(context).textTheme.bodySmall),
              Text(
                '*',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ),

          TextFormField(
            focusNode: focus,
            controller: widget.textController,
            validator: widget.validate,
            decoration: InputDecoration(
              fillColor: isFocus == true
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.tertiaryContainer,
              suffixIcon: isTrue == false
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isTrue = !isTrue;
                        });
                      },
                      child: Icon(Icons.visibility),
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          isTrue = !isTrue;
                        });
                      },
                      child: Icon(Icons.visibility_off),
                    ),
            ),
            obscureText: isTrue == true ? true : false,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isFocus == true
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

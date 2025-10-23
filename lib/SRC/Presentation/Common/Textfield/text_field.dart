import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/Login/controller/Providers/password_visibility_provider.dart';

// ignore: must_be_immutable
class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    super.key,
    this.isTrue,
    this.icons,
    this.isRequired,
    // this.val,
    this.value,
    required this.lable,
    required this.textController,
    this.keyVrify,
    this.validate,
  });

  final bool? isTrue;
  final IconData? icons;
  final String lable;
  final TextEditingController textController;
  final bool? isRequired;
  final // EmailVisibilityProvider? val;
  PasswordVisibilityProvider?
  value;
  final Key? keyVrify;
  final String? Function(String?)? validate;
  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  String? errorText;
  final FocusNode focusNode = FocusNode();
  bool isFocus = false;
  void _onFocusChange() {
    setState(() {
      if (focusNode.hasFocus) {
        isFocus = true;
      } else {
        isFocus = false;
      }

      // print('==================================');
      // print(isFocus);
    });
  }

  @override
  void initState() {
    focusNode.addListener(_onFocusChange);

    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Future<String> _vailedEmail(value) async {
    //   if (value == null || value.isEmpty) {
    //     return 'Email is Required !';
    //   }
    //   //  else if (value != 'info@gmail.com') {
    //   //   return '! invailed Email';
    //   // }
    //   else if (value == '@' || value == '.') {
    //     return '! invailed Email';
    //   } else {
    //     return '! Retry agine';
    //   }
    // }

    // Future<String> _vailedPassword(value) async {
    //   if (value == null || value.isEmpty) {
    //     return 'Password is Required !';
    //   } else if (value != '1234') {
    //     return '! invailed Password';
    //   } else {
    //     return '! Retry agine';
    //   }
    // }

    // @override
    // void initState() {
    //   super.initState();

    // Validate when user taps into the field
    // widget.textFocusNode.addListener(() {
    //   if (widget.textFocusNode.hasFocus) {
    //     setState(() {
    //       errorText = widget.validate(widget.textController.text);
    //     });
    //   }
    // });
    // }

    return SizedBox(
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
            // key: widget.keyVrify,
            controller: widget.textController,
            focusNode: focusNode,
            // onChanged: _validate,
            validator: widget.validate,
            decoration: InputDecoration(
              filled: true,
              fillColor: isFocus == true
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.tertiaryContainer,
              suffixIcon: widget.icons == null
                  ? null
                  : InkWell(
                      onTap: () {
                        if (widget.icons == Icons.cancel_outlined) {
                          widget.textController.clear();
                        } else if (widget.icons == Icons.visibility ||
                            widget.icons == Icons.visibility_off) {
                          widget.value?.Show();
                        }
                      },
                      child: Icon(widget.icons),
                    ),
            ),
            obscureText: widget.isTrue == true
                ? widget.value?.isVisibility ?? false
                : false,
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

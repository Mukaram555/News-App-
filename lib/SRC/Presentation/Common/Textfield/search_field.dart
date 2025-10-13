import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChange,
    required this.sreachController,
  });

  final TextEditingController sreachController;
  final void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      controller: sreachController,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hint: Text('Search'),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CitySearchField extends StatefulWidget {
  const CitySearchField({super.key, required this.onSubmitted});

  final ValueChanged<String> onSubmitted;

  @override
  State<CitySearchField> createState() => _CitySearchFieldState();
}

class _CitySearchFieldState extends State<CitySearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final city = _controller.text.trim();
    if (city.isEmpty) return;
    FocusScope.of(context).unfocus();
    widget.onSubmitted(city);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.search,
      textCapitalization: TextCapitalization.words,
      onSubmitted: (_) => _submit(),
      decoration: InputDecoration(
        hintText: 'Search city',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          tooltip: 'Search',
          icon: const Icon(Icons.arrow_forward),
          onPressed: _submit,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

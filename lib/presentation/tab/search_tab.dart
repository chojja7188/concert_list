import 'package:concert_list_app/config/ui_config.dart';
import 'package:concert_list_app/presentation/search/search_header.dart';
import 'package:concert_list_app/presentation/search/search_input.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchHeader(),
        SearchInput(),
      ],
    );
  }
}

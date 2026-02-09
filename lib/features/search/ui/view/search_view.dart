import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/ui/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/ui/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 8),
              CustomSearchTextField(),
              SizedBox(height: 16),
              Text('Search Result', style: Styles.textStyle18),
              SizedBox(height: 16),
              Expanded(child: SearchResultListView()),
            ],
          ),
        ),
      ),
    );
  }
}

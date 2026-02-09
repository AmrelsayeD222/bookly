import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/ui/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/ui/widgets/custom_appbar.dart';
import 'package:bookly/features/home/ui/widgets/featured_list_view.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Best Seller', style: Styles.textStyle18),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          BestSellerListView(),
        ],
      ),
    );
  }
}

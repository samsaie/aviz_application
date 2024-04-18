import 'package:aviz_application/features/all_hotPromotion_screen.dart';

import '../../../Constants/theme.dart';
import '../../../DI/di.dart';
import '../../../Constants/color.dart';
import '../../../widgets/appBars.dart';
import '../../all_recentPromotion_screen.dart';
import '../bloc/home_bloc.dart';
import '../../../widgets/hot_promotion_card.dart';
import '../../../widgets/recent_promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        HomeBloc homeBloc = HomeBloc(
          locator.get(),
        );
        homeBloc.add(
          HomeGetInitializeData(),
        );
        return homeBloc;
      },
      child: const ViewContainer(),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                const HomeAppBar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('آویز های داغ',
                            style: appTheme().textTheme.titleLarge!),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AllHotPromotionScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'مشاهده همه',
                            style: appTheme()
                                .textTheme
                                .bodyMedium!
                                .apply(color: AppColors.grey400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is HomeLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                },
                if (state is HomeRequestSuccessState) ...{
                  state.hotPromotions.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (hotPromotionList) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 280,
                        child: ListView.builder(
                          itemCount: hotPromotionList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 20),
                              child: HotPromotionCard(hotPromotionList[index]),
                            );
                          },
                        ),
                      ),
                    );
                  }),
                },
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('آویز های اخیر',
                            style: appTheme().textTheme.titleLarge!),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AllRecentPromotionScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'مشاهده همه',
                            style: appTheme()
                                .textTheme
                                .bodyMedium!
                                .apply(color: AppColors.grey400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is HomeLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                },
                if (state is HomeRequestSuccessState) ...{
                  state.latestPromotions.fold((l) {
                    return SliverToBoxAdapter(
                      child: Text(l),
                    );
                  }, (latestPromotionList) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                              RecentPromotionCard(latestPromotionList[index]),
                        ),
                        childCount: latestPromotionList.length,
                      ),
                    );
                  }),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}

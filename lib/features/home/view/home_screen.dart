import '../../../DI/di.dart';
import '../../../Constants/color.dart';
import '../bloc/home_bloc.dart';
import '../../../widgets/hot_promotion_card.dart';
import '../../../widgets/normal_promotion_card.dart';
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
                SliverAppBar(
                  title:
                      Image.asset('assets/images/logo_with_not_background.png'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'آویز های داغ',
                          style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         const HotPromotionsCardListScreen(),
                            //   ),
                            // );
                          },
                          child: const Text(
                            'مشاهده همه',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 14,
                                color: AppColors.borderGrey),
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
                        const Text(
                          'آویز های اخیر',
                          style: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'مشاهده همه',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 14,
                                color: AppColors.borderGrey),
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
                              NormalPromotionCard(latestPromotionList[index]),
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

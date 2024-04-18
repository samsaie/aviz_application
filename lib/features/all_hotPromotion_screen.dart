import 'package:aviz_application/widgets/hot_promotion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../DI/di.dart';
import '../widgets/recent_promotion_card.dart';
import 'home/bloc/home_bloc.dart';

class AllHotPromotionScreen extends StatefulWidget {
  const AllHotPromotionScreen({super.key});

  @override
  State<AllHotPromotionScreen> createState() => _AllHotPromotionScreenState();
}

class _AllHotPromotionScreenState extends State<AllHotPromotionScreen> {
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
      child: const PageContainer(),
    );
  }
}

class PageContainer extends StatelessWidget {
  const PageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Image.asset(
                        'assets/images/logo_with_not_background.png'),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
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
                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            childCount: hotPromotionList.length,
                            (context, index) {
                          return HotPromotionCard(hotPromotionList[index]);
                        }),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 0.8),
                      );
                    }),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

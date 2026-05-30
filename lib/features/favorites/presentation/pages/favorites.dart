import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      _onScroll,
    ); // listen to user scroll to load more
    _setLogs();
    Future.delayed(Duration.zero, _getDrafts);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _getDrafts() async {
    await context.read<FavoriteCubit>().getFavoriteStations(skip: 0);
  }

  Future<void> _setLogs() async {
    // unawaited(
    //   GoogleAnalytics().logScreenView(screenName: SCREENS.favoritesView),
    // );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Trigger load more when near the bottom
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: 'Favorites'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return switch (state) {
              FavoriteLoading() => const Center(child: Loader()),
              FavoriteLoaded(
                stations: final stations,
                isLoadingMore: final isLoadingMore,
              ) =>
                stations.isNotEmpty
                    ? ListView.separated(
                        controller: _scrollController,
                        itemCount: stations.length + (isLoadingMore ? 1 : 0),
                        separatorBuilder: (context, index) => const Gap(10),
                        itemBuilder: (context, index) {
                          // load more loader
                          if (index == stations.length) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 36),
                              child: Center(child: Loader()),
                            );
                          }

                          final station = stations[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Slidable(
                              key: Key('favorite_$index'),
                              endActionPane: ActionPane(
                                motion: const DrawerMotion(),
                                extentRatio: 0.2,
                                children: [
                                  CustomSlidableAction(
                                    onPressed: (context) => {},
                                    backgroundColor: AppColors.error,

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.trash,
                                          colorFilter: ColorFilter.mode(
                                            Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                ),
                                child: StationItem(
                                  name: station.name,
                                  location: station.location?.locationText,
                                  language: station.languages.firstOrNull?.name,
                                  logo: station.logo,
                                  onFavorite: () {
                                    if (!(station.isFavorite ?? false)) return;
                                    context
                                        .read<FavoriteCubit>()
                                        .removeFromFavorites(
                                          stationId: station.id,
                                        );
                                  },
                                  isFavorite: station.isFavorite ?? false,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.radioPlayer,
                                    arguments: RadioPlayerParams(
                                      station: station,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(child: TextBold('No favorites added yet')),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}

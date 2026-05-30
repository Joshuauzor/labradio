import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.favorites),
                    icon: Center(
                      child: SvgPicture.asset(
                        AppAssets.favorite,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  HeaderText('Discover', fontSize: 26),
                  HomeIcon(),
                ],
              ),
              Gap(16),
              Expanded(
                child: BlocBuilder<ExploreStationsCubit, ExploreStationsState>(
                  builder: (context, state) {
                    return switch (state) {
                      ExploreStationsLoading() => const StationListLoader(),
                      ExploreStationsLoaded(:final stations) => Stack(
                        children: [
                          ListView.separated(
                            itemCount: state.stations.length,
                            separatorBuilder: (context, index) => Gap(10),
                            itemBuilder: (context, index) {
                              final station = stations[index];
                              print(station.isFavorite);
                              return StationItem(
                                name: station.name,
                                location: station.location?.locationText,
                                language: station.languages.firstOrNull?.name,
                                logo: station.logo,
                                onFavorite: () {
                                  if (station.isFavorite ?? false) {
                                    context
                                        .read<ExploreStationsCubit>()
                                        .removeFromFavorites(
                                          stationId: station.id,
                                        );
                                  } else {
                                    context
                                        .read<ExploreStationsCubit>()
                                        .addToFavorites(stationId: station.id);
                                  }
                                },
                                isFavorite: station.isFavorite ?? false,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.radioPlayer,
                                  arguments: RadioPlayerParams(
                                    station: station,
                                  ),
                                ),
                              );
                            },
                          ),
                          const Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: MiniPlayer(),
                          ),
                        ],
                      ),
                      _ => const StationListLoader(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  HomeIcon(),
                  HeaderText('Discover', fontSize: 26),
                  HomeIcon(icon: AppAssets.search),
                ],
              ),
              Gap(16),
              Expanded(
                child: BlocBuilder<ExploreStationsCubit, ExploreStationsState>(
                  builder: (context, state) {
                    return switch (state) {
                      ExploreStationsLoading() => const StationListLoader(),
                      ExploreStationsLoaded() => Stack(
                        children: [
                          ListView.separated(
                            itemCount: state.stations.length,
                            separatorBuilder: (context, index) => Gap(10),
                            itemBuilder: (context, index) {
                              final station = state.stations[index];
                              return StationItem(
                                name: station.name,
                                location: station.location?.locationText,
                                language: station.languages.firstOrNull?.name,
                                logo: station.logo,
                                onFavorite: () {},
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

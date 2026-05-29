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
                      ExploreStationsLoaded() => Column(
                        children: [StationItem()],
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

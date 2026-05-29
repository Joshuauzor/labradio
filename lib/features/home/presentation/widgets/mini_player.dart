import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';
import 'package:labradio/features/features.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final radioPlayerCubit = context.read<RadioPlayerCubit>();

    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loaded: (station) => station != null
              ? StreamBuilder<RadioStreamData>(
                  stream: radioPlayerCubit.positionDataStream,
                  builder: (context, snapshot) {
                    return (snapshot.data != null &&
                            snapshot.data!.currentIndex != null)
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 8,
                              bottom: 4,
                            ),
                            child: GestureDetector(
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity! > 0) {
                                  // swipe right
                                  radioPlayerCubit.pause();
                                } else {
                                  // swipe left
                                  radioPlayerCubit.pause();
                                }
                              },
                              child: ColoredBox(
                                color: AppColors.background,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: AppColors.primary,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.shadow,
                                        blurRadius: 27,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 4,
                                          right: 8,
                                          top: 4,
                                          bottom: 4,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                behavior:
                                                    HitTestBehavior.opaque,
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    AppRoutes.radioPlayer,
                                                    arguments:
                                                        RadioPlayerParams(
                                                          fullPlayer: false,
                                                          station:
                                                              radioPlayerCubit
                                                                  .station!,
                                                        ),
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    PhotoHolder(
                                                      height: 57.5,
                                                      width: 57.5,
                                                      borderRadius: 8,
                                                      image: context
                                                          .read<
                                                            RadioPlayerCubit
                                                          >()
                                                          .station
                                                          ?.logo,
                                                    ),
                                                    const Gap(8),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextRegular(
                                                            station.name,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          const Gap(4),
                                                          TextRegular(
                                                            station
                                                                    .location
                                                                    ?.locationText ??
                                                                '',
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 10,

                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Gap(22),

                                            CircularButton(
                                              onTap: () {
                                                // toggle main music player
                                                if (snapshot.data?.playing ??
                                                    true) {
                                                  radioPlayerCubit.pause();
                                                } else {
                                                  radioPlayerCubit.play();
                                                }
                                              },
                                              icon:
                                                  snapshot.data?.playing ??
                                                      false
                                                  ? AppAssets.pause
                                                  : AppAssets.play,
                                              width: 28,
                                              height: 28,
                                              iconSize: 14,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox();
                  },
                )
              : const SizedBox(),
        );
      },
    );
  }
}

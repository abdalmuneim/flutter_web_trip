import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trips_app/core/helper/foramt_dates.dart';
import 'package:trips_app/core/resources/app_colors.dart';
import 'package:trips_app/presentation/widgets/custom_divider.dart';
import '../../domain/entities/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'proposal sent':
        return AppColors.instance.primary;
      case 'pending approval':
        return AppColors.instance.red;
      case 'ready for travel':
        return AppColors.instance.blueAccent;
      default:
        return AppColors.instance.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// trip image and status
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 13,
                child: Image.network(
                  trip.coverImage ?? "",
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Container(
                        color: Colors.grey[900],
                        child: const Icon(Icons.error, color: Colors.white54),
                      ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Theme.of(context).cardColor,
                        Theme.of(context).cardColor.withValues(alpha: 0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.instance.blackLight1.withValues(
                      alpha: 0.15,
                    ),
                    border: Border.all(color: _getStatusColor(trip.status)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trip.status ?? "",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(trip.status).withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.more_horiz, color: Colors.white),
                ),
              ),
            ],
          ),

          /// trip title and dates and participants
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.title ?? "",
                  style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/png/calendar.png',
                      width: 16,
                      height: 16,
                      color: AppColors.instance.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ForamtDates.instance.formatDateRange(
                        trip.dates?.start,
                        trip.dates?.end,
                      ),
                      style: GoogleFonts.inter(
                        color: AppColors.instance.grey,
                        fontSize: 10,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomDivider(height: 1, width: double.infinity),
                const SizedBox(height: 16),

                /// participants
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 32,
                        child: Stack(
                          children: [
                            for (
                              var i = 0;
                              i <
                                  (trip.participants != null
                                      ? trip.participants!.length > 3
                                          ? 4
                                          : trip.participants!.length
                                      : 0);
                              i++
                            ) ...[
                              Positioned(
                                left: i * 15.0,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        i == 3 &&
                                                (trip.participants?.length ??
                                                        0) >
                                                    3
                                            ? AppColors.instance.blackLight2
                                            : AppColors.instance.blackLight1,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child:
                                        i == 3 &&
                                                (trip.participants?.length ??
                                                        0) >
                                                    3
                                            ? Center(
                                              child: Text(
                                                "+${(trip.participants?.length ?? 0) - 3}",
                                                style: GoogleFonts.inter(
                                                  color:
                                                      AppColors
                                                          .instance
                                                          .primary,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                            : CachedNetworkImage(
                                              imageUrl:
                                                  trip
                                                      .participants?[i]
                                                      .avatarUrl ??
                                                  "",
                                              fit: BoxFit.cover,
                                              placeholder:
                                                  (context, url) => Container(
                                                    color:
                                                        AppColors
                                                            .instance
                                                            .blackLight1,
                                                  ),
                                              errorWidget:
                                                  (
                                                    context,
                                                    url,
                                                    error,
                                                  ) => Container(
                                                    color:
                                                        AppColors
                                                            .instance
                                                            .blackLight1,
                                                    child: Icon(
                                                      Icons.person_2_outlined,
                                                      color:
                                                          AppColors
                                                              .instance
                                                              .grey,
                                                      size: 16,
                                                    ),
                                                  ),
                                            ),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '${trip.unfinishedTasks ?? 0} unfinished tasks',
                      style: GoogleFonts.inter(
                        color: AppColors.instance.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

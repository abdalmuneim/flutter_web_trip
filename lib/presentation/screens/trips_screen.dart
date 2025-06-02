import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trips_app/core/resources/app_colors.dart';
import 'package:trips_app/presentation/widgets/app_logo.dart';
import 'package:trips_app/presentation/widgets/custom_divider.dart';
import 'package:trips_app/presentation/widgets/user_avatar.dart';
import '../providers/trip_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/trip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TripsScreen extends ConsumerStatefulWidget {
  const TripsScreen({super.key});

  @override
  ConsumerState<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends ConsumerState<TripsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tripsAsync = ref.watch(tripProvider);
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      key: _scaffoldKey,
      drawer: isSmallScreen ? AppDrawer(tabController: _tabController) : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(
                0,
                Size.fromHeight(kToolbarHeight).height / 65,
              ),
              child: Divider(color: Colors.white12, height: 1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              child: AppBar(
                leading:
                    isSmallScreen
                        ? IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        )
                        : null,
                title: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      children: [
                        const AppLogo(),
                        if (!isSmallScreen) ...[
                          Spacer(),
                          TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white30,
                            indicatorColor: AppColors.instance.primary,
                            dividerColor: Colors.white30,
                            dividerHeight: 0,
                            tabs: const [
                              Tab(text: 'Items'),
                              Tab(text: 'Pricing'),
                              Tab(text: 'Info'),
                              Tab(text: 'Tasks'),
                              Tab(text: 'Analytics'),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                actions: [
                  !isSmallScreen
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomDivider(
                          height: 25,
                          width: 2,
                          color: Colors.white12,
                        ),
                      )
                      : const SizedBox(),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/svg/Icons_1.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // TODO: Implement settings action
                    },
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/svg/Icons.svg',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // TODO: Implement notifications action
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomDivider(
                      height: 25,
                      width: 2,
                      color: Colors.white12,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16),
                    child: UserAvatar(
                      isSmallScreen: isSmallScreen,
                      avatarImage: 'assets/images/png/Frame_77134.png',
                      userName: !isSmallScreen ? 'John Doe' : '',
                      onTap: () {
                        // TODO: Implement user profile action
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.027,
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Trips tab
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.027),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {
                            // TODO: Implement filter action
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8),

                            decoration: BoxDecoration(
                              color: AppColors.instance.grey.withValues(
                                alpha: .1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/png/filter_ic.png',
                            ),
                          ),
                        ),
                        if (!isSmallScreen) ...[
                          SizedBox(width: 16),

                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.15,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColors.instance.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  'Add a New Item',
                                  style: GoogleFonts.inter(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.027),

                Expanded(
                  child: tripsAsync.when(
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error:
                        (error, stack) => Center(
                          child: Text(
                            'Error: $error',
                            style: GoogleFonts.poppins(color: Colors.red),
                          ),
                        ),
                    data:
                        (trips) =>
                            trips.isEmpty
                                ? Center(
                                  child: Text(
                                    'No trips available',
                                    style: GoogleFonts.poppins(),
                                  ),
                                )
                                : LayoutBuilder(
                                  builder: (context, constraints) {
                                    // Responsive grid layout
                                    final crossAxisCount =
                                        (constraints.maxWidth > 1200)
                                            ? 5
                                            : (constraints.maxWidth > 800)
                                            ? 4
                                            : (constraints.maxWidth > 600)
                                            ? 3
                                            : 1;
                                    final childAspectRatio =
                                        (constraints.maxWidth > 1200)
                                            ? 0.71
                                            : (constraints.maxWidth > 800)
                                            ? 0.66
                                            : (constraints.maxWidth > 600)
                                            ? 0.66
                                            : 0.86;

                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: crossAxisCount,
                                            mainAxisSpacing: 2.w,
                                            crossAxisSpacing: 1.w,
                                            childAspectRatio: childAspectRatio,
                                          ),
                                      itemCount: trips.length,
                                      itemBuilder:
                                          (context, index) =>
                                              TripCard(trip: trips[index]),
                                    );
                                  },
                                ),
                  ),
                ),
              ],
            ),
            // Pricing tab
            Center(
              child: Text('Pricing', style: GoogleFonts.poppins(fontSize: 24)),
            ),
            // Info tab
            Center(
              child: Text('Info', style: GoogleFonts.poppins(fontSize: 24)),
            ),
            // Tasks tab
            Center(
              child: Text('Tasks', style: GoogleFonts.poppins(fontSize: 24)),
            ),
            // Analytics tab
            Center(
              child: Text(
                'Analytics',
                style: GoogleFonts.poppins(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

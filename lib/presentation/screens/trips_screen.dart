import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trips_app/core/resources/app_colors.dart';
import 'package:trips_app/presentation/widgets/hoverable_card.dart';
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
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _mainAnimationController;
  late AnimationController _headerAnimationController;
  late AnimationController _fabAnimationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _scaleAnimation;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    // Main content animation controller
    _mainAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Header animation controller
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // FAB animation controller
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Initialize animations
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _headerSlideAnimation = Tween<double>(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _headerAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Start animations
    _startAnimations();

    // Listen to tab changes for animations
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _animateTabChange();
      }
    });
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 100));
    _headerAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _mainAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _fabAnimationController.forward();
  }

  void _animateTabChange() {
    _mainAnimationController.reset();
    _mainAnimationController.forward();

    Future.delayed(const Duration(milliseconds: 300), () {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _mainAnimationController.dispose();
    _headerAnimationController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedIconButton({
    required Widget icon,
    required VoidCallback onPressed,
    int delay = 0,
  }) {
    return AnimatedBuilder(
      animation: _headerAnimationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _headerSlideAnimation.value * (1 + delay * 0.1)),
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => setState(() {}),
                onExit: (_) => setState(() {}),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.transparent,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: onPressed,
                      hoverColor: Colors.white.withValues(alpha: .1),
                      splashColor: AppColors.instance.primary.withValues(
                        alpha: .2,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(8),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 150),
                          scale: 1.0,
                          child: icon,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedFilterButton() {
    return AnimatedBuilder(
      animation: _fabAnimationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {
                  _fabAnimationController.reset();
                  _fabAnimationController.forward();
                  // TODO: Implement filter action
                },
                hoverColor: AppColors.instance.primary.withValues(alpha: .1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.instance.grey.withValues(alpha: .1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.instance.primary.withValues(alpha: .1),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 200),
                    scale: 1.0,
                    child: Image.asset('assets/images/png/filter_ic.png'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedAddButton(bool isSmallScreen) {
    if (isSmallScreen) return const SizedBox();

    return AnimatedBuilder(
      animation: _fabAnimationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeInAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.3, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _fabAnimationController,
                curve: Curves.elasticOut,
              ),
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    // TODO: Add new item action
                  },
                  hoverColor: AppColors.instance.primary.withValues(alpha: .1),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.instance.primary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.instance.primary.withValues(
                            alpha: .4,
                          ),
                          blurRadius: 15,
                          spreadRadius: 3,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: 1.0,
                          child: const Icon(Icons.add, color: Colors.black),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add a New Item',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedGridItem(Widget child, int index) {
    return AnimatedBuilder(
      animation: _mainAnimationController,
      builder: (context, _) {
        final delay = index * 0.1;
        final adjustedAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _mainAnimationController,
            curve: Interval(
              (0.3 + delay).clamp(0.0, 0.8),
              (0.8 + delay).clamp(0.2, 1.0),
              curve: Curves.easeOutBack,
            ),
          ),
        );

        return FadeTransition(
          opacity: adjustedAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.5),
              end: Offset.zero,
            ).animate(adjustedAnimation),
            child: ScaleTransition(
              scale: Tween<double>(
                begin: 0.8,
                end: 1.0,
              ).animate(adjustedAnimation),
              child: HoverableCard(child: child),
            ),
          ),
        );
      },
    );
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
        child: AnimatedBuilder(
          animation: _headerAnimationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _headerSlideAnimation.value),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(
                      0,
                      Size.fromHeight(kToolbarHeight).height / 65,
                    ),
                    child: FadeTransition(
                      opacity: _fadeInAnimation,
                      child: const Divider(color: Colors.white12, height: 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: AppBar(
                      leading:
                          isSmallScreen
                              ? _buildAnimatedIconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                              )
                              : null,
                      title: FadeTransition(
                        opacity: _fadeInAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Row(
                                children: [
                                  const AppLogo(),
                                  if (!isSmallScreen) ...[
                                    const Spacer(),
                                    AnimatedBuilder(
                                      animation: _headerAnimationController,
                                      builder: (context, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, -0.5),
                                            end: Offset.zero,
                                          ).animate(
                                            CurvedAnimation(
                                              parent:
                                                  _headerAnimationController,
                                              curve: const Interval(
                                                0.3,
                                                1.0,
                                                curve: Curves.easeOut,
                                              ),
                                            ),
                                          ),
                                          child: MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: TabBar(
                                              controller: _tabController,
                                              isScrollable: true,
                                              labelColor: Colors.white,
                                              unselectedLabelColor:
                                                  Colors.white30,
                                              indicatorColor:
                                                  AppColors.instance.primary,
                                              dividerColor: Colors.white30,
                                              dividerHeight: 0,
                                              splashFactory:
                                                  InkRipple.splashFactory,
                                              overlayColor:
                                                  WidgetStateProperty.all(
                                                    AppColors.instance.primary
                                                        .withValues(alpha: .1),
                                                  ),
                                              tabs: const [
                                                Tab(text: 'Items'),
                                                Tab(text: 'Pricing'),
                                                Tab(text: 'Info'),
                                                Tab(text: 'Tasks'),
                                                Tab(text: 'Analytics'),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        if (!isSmallScreen)
                          FadeTransition(
                            opacity: _fadeInAnimation,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: CustomDivider(
                                height: 25,
                                width: 2,
                                color: Colors.white12,
                              ),
                            ),
                          )
                        else
                          const SizedBox(),
                        _buildAnimatedIconButton(
                          icon: SvgPicture.asset(
                            'assets/images/svg/Icons_1.svg',
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // TODO: Implement settings action
                          },
                          delay: 1,
                        ),
                        const SizedBox(width: 8),
                        _buildAnimatedIconButton(
                          icon: SvgPicture.asset(
                            'assets/images/svg/Icons.svg',
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // TODO: Implement notifications action
                          },
                          delay: 2,
                        ),
                        FadeTransition(
                          opacity: _fadeInAnimation,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: CustomDivider(
                              height: 25,
                              width: 2,
                              color: Colors.white12,
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _headerAnimationController,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(
                                0,
                                _headerSlideAnimation.value * 1.3,
                              ),
                              child: FadeTransition(
                                opacity: _fadeInAnimation,
                                child: ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 16,
                                      ),
                                      child: TweenAnimationBuilder<double>(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        tween: Tween<double>(
                                          begin: 1.0,
                                          end: 1.0,
                                        ),
                                        builder: (context, scale, _) {
                                          return Transform.scale(
                                            scale: scale,
                                            child: UserAvatar(
                                              isSmallScreen: isSmallScreen,
                                              avatarImage:
                                                  'assets/images/png/Frame_77134.png',
                                              userName:
                                                  !isSmallScreen
                                                      ? 'John Doe'
                                                      : '',
                                              onTap: () {
                                                // TODO: Implement user profile action
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.027,
        ),
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            // Trips tab with animations
            FadeTransition(
              opacity: _fadeInAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.027,
                    ),
                    AnimatedBuilder(
                      animation: _mainAnimationController,
                      builder: (context, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-0.3, 0),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: _mainAnimationController,
                              curve: const Interval(
                                0.2,
                                0.7,
                                curve: Curves.easeOut,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeTransition(
                                opacity: _fadeInAnimation,
                                child: Text(
                                  'Items',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  _buildAnimatedFilterButton(),
                                  if (!isSmallScreen) ...[
                                    const SizedBox(width: 16),
                                    _buildAnimatedAddButton(isSmallScreen),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.027,
                    ),
                    Expanded(
                      child: tripsAsync.when(
                        loading:
                            () => AnimatedBuilder(
                              animation: _mainAnimationController,
                              builder: (context, child) {
                                return FadeTransition(
                                  opacity: _fadeInAnimation,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                            ),
                        error:
                            (error, stack) => AnimatedBuilder(
                              animation: _mainAnimationController,
                              builder: (context, child) {
                                return FadeTransition(
                                  opacity: _fadeInAnimation,
                                  child: Center(
                                    child: Text(
                                      'Error: $error',
                                      style: GoogleFonts.poppins(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                        data:
                            (trips) =>
                                trips.isEmpty
                                    ? AnimatedBuilder(
                                      animation: _mainAnimationController,
                                      builder: (context, child) {
                                        return FadeTransition(
                                          opacity: _fadeInAnimation,
                                          child: Center(
                                            child: Text(
                                              'No trips available',
                                              style: GoogleFonts.poppins(),
                                            ),
                                          ),
                                        );
                                      },
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
                                            (constraints.maxWidth > 1800)
                                                ? 0.78
                                                : (constraints.maxWidth > 1300)
                                                ? 0.74
                                                : (constraints.maxWidth > 1200)
                                                ? 0.68
                                                : (constraints.maxWidth > 1100)
                                                ? 0.75
                                                : (constraints.maxWidth > 1000)
                                                ? 0.71
                                                : (constraints.maxWidth > 900)
                                                ? 0.7
                                                : (constraints.maxWidth > 800)
                                                ? 0.9
                                                : (constraints.maxWidth > 700)
                                                ? 0.6
                                                : 0.7;

                                        return GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: crossAxisCount,
                                                mainAxisSpacing: 2.w,
                                                crossAxisSpacing: 1.w,
                                                childAspectRatio:
                                                    childAspectRatio,
                                              ),
                                          itemCount: trips.length,
                                          itemBuilder:
                                              (context, index) =>
                                                  _buildAnimatedGridItem(
                                                    TripCard(
                                                      trip: trips[index],
                                                    ),
                                                    index,
                                                  ),
                                        );
                                      },
                                    ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Other tabs with fade animations
            ...List.generate(4, (index) {
              final tabNames = ['Pricing', 'Info', 'Tasks', 'Analytics'];
              return FadeTransition(
                opacity: _fadeInAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Center(
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Text(
                        tabNames[index],
                        style: GoogleFonts.poppins(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

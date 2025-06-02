import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  final TabController tabController;

  const AppDrawer({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          ListTile(
            selected: tabController.index == 0,
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: .1),
            leading: SvgPicture.asset(
              'assets/images/svg/Vector.svg',
              color: tabController.index == 0 ? Colors.white : Colors.white54,
              width: 24,
            ),
            title: Text(
              'Trips',
              style: GoogleFonts.inter(
                color: tabController.index == 0 ? Colors.white : Colors.white70,
              ),
            ),
            onTap: () {
              tabController.animateTo(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: tabController.index == 1,
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: .1),
            leading: SvgPicture.asset(
              'assets/images/svg/Vector.svg',
              color: tabController.index == 1 ? Colors.white : Colors.white54,
              width: 24,
            ),
            title: Text(
              'Pricing',
              style: GoogleFonts.inter(
                color: tabController.index == 1 ? Colors.white : Colors.white70,
              ),
            ),
            onTap: () {
              tabController.animateTo(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: tabController.index == 2,
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: .1),
            leading: SvgPicture.asset(
              'assets/images/svg/Vector.svg',
              color: tabController.index == 2 ? Colors.white : Colors.white54,
              width: 24,
            ),
            title: Text(
              'Info',
              style: GoogleFonts.inter(
                color: tabController.index == 2 ? Colors.white : Colors.white70,
              ),
            ),
            onTap: () {
              tabController.animateTo(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: tabController.index == 3,
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: .1),
            leading: SvgPicture.asset(
              'assets/images/svg/Vector.svg',
              color: tabController.index == 3 ? Colors.white : Colors.white54,
              width: 24,
            ),
            title: Text(
              'Tasks',
              style: GoogleFonts.inter(
                color: tabController.index == 3 ? Colors.white : Colors.white70,
              ),
            ),
            onTap: () {
              tabController.animateTo(3);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: tabController.index == 4,
            selectedTileColor: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: .1),
            leading: SvgPicture.asset(
              'assets/images/svg/Vector.svg',
              color: tabController.index == 4 ? Colors.white : Colors.white54,
              width: 24,
            ),
            title: Text(
              'Analytics',
              style: GoogleFonts.inter(
                color: tabController.index == 4 ? Colors.white : Colors.white70,
              ),
            ),
            onTap: () {
              tabController.animateTo(4);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

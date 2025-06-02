import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAvatar extends StatelessWidget {
  final String userName;
  final String avatarImage;
  final bool isSmallScreen;
  final VoidCallback? onTap;

  const UserAvatar({
    super.key,
    required this.userName,
    required this.isSmallScreen,
    required this.avatarImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Theme.of(
              context,
            ).primaryColor.withValues(alpha: 0.1),
            backgroundImage: AssetImage(avatarImage),
          ),
          const SizedBox(width: 8),

          Row(
            children: [
              Text(
                userName,
                style: GoogleFonts.inter(fontWeight: FontWeight.normal),
              ),
              if (!isSmallScreen) ...[
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: Colors.white,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

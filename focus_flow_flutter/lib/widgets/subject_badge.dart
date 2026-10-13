import 'package:flutter/material.dart';

class SubjectBadge extends StatelessWidget {
  final String name;
  final String colorHex;
  final String? iconName;
  final VoidCallback? onDelete;

  const SubjectBadge({
    super.key,
    required this.name,
    required this.colorHex,
    this.iconName,
    this.onDelete,
  });

  static Color parseHexColor(String hex) {
    try {
      final clean = hex.replaceAll('#', '');
      if (clean.length == 6) {
        return Color(int.parse('FF$clean', radix: 16));
      }
    } catch (_) {}
    return const Color(0xFF3B82F6);
  }

  static IconData getIconData(String? icon) {
    switch (icon?.toLowerCase()) {
      case 'code':
      case 'terminal':
        return Icons.code_rounded;
      case 'calculate':
      case 'calculator':
      case 'math':
        return Icons.calculate_rounded;
      case 'science':
      case 'flask':
        return Icons.science_rounded;
      case 'history':
        return Icons.account_balance_rounded;
      case 'language':
      case 'translate':
        return Icons.translate_rounded;
      case 'art':
      case 'design':
        return Icons.palette_rounded;
      default:
        return Icons.menu_book_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = parseHexColor(colorHex);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(getIconData(iconName), size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          if (onDelete != null) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: onDelete,
              child: Icon(Icons.close_rounded, size: 13, color: color),
            ),
          ],
        ],
      ),
    );
  }
}

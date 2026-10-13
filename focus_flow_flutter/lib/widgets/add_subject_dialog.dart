import 'package:flutter/material.dart';
import '../client.dart';

class AddSubjectDialog extends StatefulWidget {
  final VoidCallback onSubjectAdded;

  const AddSubjectDialog({
    super.key,
    required this.onSubjectAdded,
  });

  @override
  State<AddSubjectDialog> createState() => _AddSubjectDialogState();
}

class _AddSubjectDialogState extends State<AddSubjectDialog> {
  final _nameController = TextEditingController();
  String _selectedColor = '#3B82F6';
  String _selectedIcon = 'book';
  bool _isLoading = false;

  final List<String> _colors = [
    '#3B82F6', // Blue
    '#10B981', // Green
    '#F59E0B', // Amber
    '#EF4444', // Red
    '#8B5CF6', // Purple
    '#EC4899', // Pink
    '#06B6D4', // Cyan
  ];

  final List<Map<String, dynamic>> _icons = [
    {'name': 'book', 'icon': Icons.menu_book_rounded},
    {'name': 'calculator', 'icon': Icons.calculate_rounded},
    {'name': 'code', 'icon': Icons.code_rounded},
    {'name': 'science', 'icon': Icons.science_rounded},
    {'name': 'language', 'icon': Icons.translate_rounded},
    {'name': 'history', 'icon': Icons.account_balance_rounded},
    {'name': 'art', 'icon': Icons.palette_rounded},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a subject name')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await client.subject.createSubject(
        name: name,
        colorHex: _selectedColor,
        iconName: _selectedIcon,
      );
      widget.onSubjectAdded();
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add subject: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Study Subject'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Subject Name',
                hintText: 'e.g., Computer Systems, Biology, French',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Color Tag',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _colors.map((hex) {
                final isSelected = _selectedColor == hex;
                final color = Color(
                  int.parse('FF${hex.replaceAll('#', '')}', radix: 16),
                );
                return InkWell(
                  onTap: () => setState(() => _selectedColor = hex),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 2.5,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: color.withOpacity(0.6),
                                blurRadius: 8,
                              ),
                            ]
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, size: 18, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Icon',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: _icons.map((item) {
                final isSelected = _selectedIcon == item['name'];
                return InkWell(
                  onTap: () => setState(() => _selectedIcon = item['name']),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? Colors.blue
                            : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      size: 20,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isLoading ? null : _submit,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text('Create Subject'),
        ),
      ],
    );
  }
}

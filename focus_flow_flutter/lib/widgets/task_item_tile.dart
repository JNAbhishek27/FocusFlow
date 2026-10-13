import 'package:flutter/material.dart';
import 'package:focus_flow_client/focus_flow_client.dart';
import 'subject_badge.dart';

class TaskItemTile extends StatelessWidget {
  final StudyTask task;
  final StudySubject? subject;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final VoidCallback onStartFocus;

  const TaskItemTile({
    super.key,
    required this.task,
    this.subject,
    required this.onToggle,
    required this.onDelete,
    required this.onStartFocus,
  });

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.urgent:
        return Colors.redAccent;
      case TaskPriority.high:
        return Colors.orangeAccent;
      case TaskPriority.medium:
        return Colors.amber;
      case TaskPriority.low:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final priorityColor = _getPriorityColor(task.priority);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2330) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: task.isCompleted
              ? (isDark ? Colors.white12 : Colors.grey.shade300)
              : (isDark ? Colors.white24 : Colors.grey.shade200),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        leading: InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: task.isCompleted ? Colors.teal : Colors.transparent,
              border: Border.all(
                color: task.isCompleted ? Colors.teal : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: task.isCompleted
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted
                ? (isDark ? Colors.grey.shade500 : Colors.grey.shade400)
                : null,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              if (subject != null)
                SubjectBadge(
                  name: subject!.name,
                  colorHex: subject!.colorHex,
                  iconName: subject!.iconName,
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: priorityColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  task.priority.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: priorityColor,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timer_outlined,
                    size: 13,
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '${task.estimatedMinutes}m',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              if (task.notes != null && task.notes!.isNotEmpty)
                Text(
                  '• ${task.notes}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!task.isCompleted)
              IconButton(
                icon: const Icon(
                  Icons.play_circle_fill_rounded,
                  color: Colors.blueAccent,
                ),
                tooltip: 'Start Focus Timer',
                onPressed: onStartFocus,
              ),
            IconButton(
              icon: Icon(
                Icons.delete_outline_rounded,
                size: 20,
                color: Colors.red.withOpacity(0.7),
              ),
              tooltip: 'Delete Task',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

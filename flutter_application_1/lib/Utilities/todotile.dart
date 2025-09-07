// this is for the to do tile
import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  // We will have the Three Things Here
  final String taskName;
  final bool TaskCompletedorNot;
  Function(bool?)? onChanged;

  Todotile({
    super.key,
    required this.taskName,
    required this.TaskCompletedorNot,
    required this.onChanged,
  });

  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 244, 240, 239),
        ),
        height: 40,
        // A Testing Child
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          // in this Row We WILL pLACE the Some Kind of A Text And the Check Box for the Marking
          children: [
            Text(
              taskName,
              style: TextStyle(
                // ? indicates that If the Task Completed or the not if Yes Then lineThrough : else None
                decoration:
                    TaskCompletedorNot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),

            // This is for the Check box
            Checkbox(
              value: TaskCompletedorNot,
              onChanged: onChanged,
              activeColor: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}

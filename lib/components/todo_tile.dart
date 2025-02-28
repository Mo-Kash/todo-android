import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskComplete;
  Function(BuildContext)? deleteFunction;
  Function(bool?)? onChanged;


  TodoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteFunction
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.black,
                borderRadius: BorderRadius.circular(15),
              )
            ]
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 4,
              color: Colors.deepPurple,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.amber,
                  offset: const Offset(-2.5, -2.5)
              )
            ]
          ),
          child: Row(
            children: [
              Checkbox(
                  value: taskComplete,
                  onChanged: onChanged,
                  checkColor: Colors.amber,
                  activeColor: Colors.deepPurple,
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: taskComplete? TextDecoration.lineThrough:TextDecoration.none,
                  decorationColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

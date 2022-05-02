import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/todo_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EditTodo extends StatefulWidget {
  EditTodo({
    Key? key,
    required this.id,
    required this.name,
    required this.details
  }) : super(key: key);

  final int id;
  final String name;
  final String details;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {

  @override
  void initState(){
    super.initState();
    name = TextEditingController(text: widget.name);
    details = TextEditingController(text: widget.details);
  }

  late TextEditingController name;
  late TextEditingController details;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3DA9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Edit Todo'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20, right:20),
        // color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r)),
          // shape: BoxShape.circle
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                //SizedBox(height: 80,),
                Row(
                  children: [
                    //SizedBox(width: 20,),
                    Text(
                      'Name', style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.blue,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(

                      )
                  ),
                ),
                SizedBox(height: 50.h,),
                Row(
                  children: [
                    //SizedBox(width: 20,),
                    Text(
                      'Details', style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.blue,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),

                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                      )),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  controller: details,
                  onChanged: (text) {
                    details.value;
                  },
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          if(name.text != '' && details.text != ''){
                            Get.find<TodoController>().insertRecordsById(widget.id+1, name.text, details.text);
                            // Get.find<TodoController>().queryRecords();
                            name.text = '';
                            details.text = '';
                            Navigator.of(context).pop();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),


              ],
            )],
        ),
      ),
    );
  }
}

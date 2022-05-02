import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/todo_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TodoCreate extends StatefulWidget {
  TodoCreate({Key? key}) : super(key: key);

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {

  TextEditingController name = TextEditingController(text: '');
  TextEditingController details = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3DA9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Create Todo'),
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(10),
        //   child: Center(child: Text('Todo App')),),
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
                // child: TextField(
                //   onChanged: (text){
                //     details.value;
                //   },
                //   controller: details,
                //   keyboardType: TextInputType.multiline,
                //   maxLines: 8,
                //   ),
                // ),
                decoration: InputDecoration(
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
                            Get.find<TodoController>().insertRecords(name.text, details.text);
                            // Get.find<TodoController>().queryRecords();
                            name.text = '';
                            details.text = '';
                            Navigator.of(context).pop();
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                              'Save',
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

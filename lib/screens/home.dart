import 'package:flutter/material.dart';
import 'package:todoapp/controller/todo_controller.dart';
import 'package:todoapp/screens/create_todo.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List list;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    // getData();

  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  TextEditingController search = TextEditingController(text: '');
  FocusNode myFocusNode = FocusNode();

  // void getData()async{
  //   list = await Get.find<TodoController>().queryRecords();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r), bottomLeft: Radius.circular(50.r)),
                          ),
                            height: 50.h,
                            width: 100.w,

                          child: TextField(
                            focusNode: myFocusNode,
                            controller: search,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.sp,
                              letterSpacing: 2,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              // fillColor: Colors.lightBlueAccent,
                              // filled: true,
                            hintText: 'Search',
                            prefixStyle: TextStyle(

                            ),
                            hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                          ),
                        ),),
                    ),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            print('Hello');
                          },
                          child: Container(
                              height: 50.h,
                              width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(50.r), bottomRight: Radius.circular(50.r)),
                            ),
                            child: Center(
                              child: Text(
                                  'Search',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        )
                    ),

                  ],
                ),
            ),
          ),
        ),
        title: Center(child: Text(
                'Todo App',
              style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal
              ),
            ),
            ),

      ),
      backgroundColor: const Color(0xFF3DA9FC),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        // color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r)),
          // shape: BoxShape.circle
        ),
        child: Obx(
            () => ListView.builder(
                  itemCount: Get.find<TodoController>().queryData.value.length,
                  itemBuilder: (context, index) {
                    // print(snapshot.data[index]);
                    return Column(
                      children: [
                        SizedBox(height: 50.h,),
                        TodoWidget(index: index),
                        Container(height: 2.h, width: double.maxFinite, color: Colors.black12),
                      ],
                    );
                  }
              ),
        ),
            // return const Center(
            //     child: CircularProgressIndicator.adaptive(
            //
            //     ));

            // return Text('Hello');
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          myFocusNode.unfocus();
          Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => TodoCreate()));
        },
        tooltip: 'New Todo',
        child: const Icon(Icons.add),
      ), // This trailing comma ma
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, required this.index, }) : super(key: key);

  // final String name;
  // final String detail;
  final int index;

  @override
  Widget build(BuildContext context) {
    var data = Get.find<TodoController>().queryData.value;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blue[100],
        highlightColor: Colors.blue[100],
        onTap:(){
          Navigator.push(context, MaterialPageRoute(builder:
              (BuildContext context) {
            return EditTodo(
              name: data[index]['name'],
              id: index,
              details: data[index]['details'],
            );
            },
          ));
        },
        child: Container(
          height: 100.h,
          width: double.maxFinite,
          // color: Colors.green,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width:20.w),
              Image.asset('assets/checkf.png'),
              SizedBox(width: 25.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      data[index]['name'],
                    style: TextStyle(
                      fontSize: 25.sp,

                    )
                  ),
                  SizedBox(height:10.h),
                  Text(
                      data[index]['details'],
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black26,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

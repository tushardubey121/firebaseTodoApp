import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo_app/modules/add_todo/models/add_todo_request.dart';
import 'package:firebase_todo_app/modules/todo_list/models/todo_model.dart';
import 'package:firebase_todo_app/utils/api_status.dart';

class TodoService {
  final String _todoCollection = 'todo';

  Future<ApiResponse> addTodoItem(AddTodoRequest request) async {
    try {
      final response = await FirebaseFirestore.instance.collection(_todoCollection).add(request.toJson());
      return ApiResponse.success(response);
    } catch (error) {
      log('Error => $error');
      return ApiResponse.error(error.toString());
    }
  }

  Future<ApiResponse> todoList(String userId) async {
    try {
      final data = await FirebaseFirestore.instance.collection(_todoCollection).where("created_by", isEqualTo: userId).get();
      List<TodoModel> _list = List.generate(data.docs.length, (index) {
        var todo = TodoModel.fromJson(data.docs.elementAt(index).data());
        todo.docId = data.docs.elementAt(index).id;
        return todo;
      });
      return ApiResponse.success(_list);
    } catch (e) {
      log("Error : ${e.toString()}");
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> deleteTodo(String docId) async {
    try {
      final data = await FirebaseFirestore.instance.collection(_todoCollection).doc(docId).delete();
      return ApiResponse.success(true);
    } catch (e) {
      log("Error : ${e.toString()}");
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> todoDataById(String docId) async {
    try {
      final data = await FirebaseFirestore.instance.collection(_todoCollection).doc(docId).get();
      return ApiResponse.success(TodoModel.fromJson(data.data() ?? {}));
    } catch (e) {
      log("Error : ${e.toString()}");
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> updateTodo(AddTodoRequest request, String docId) async {
    try {
      final data = await FirebaseFirestore.instance.collection(_todoCollection).doc(docId).update(request.toJson());
      return ApiResponse.success(true);
    } catch (e) {
      log("Error : ${e.toString()}");
      return ApiResponse.error(e.toString());
    }
  }
}

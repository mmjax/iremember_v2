import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iremember/data/memory/models.dart';


class MemoryRepository {
  Future<List<Memory>> getMemories() async {
    final response = await http.get(Uri.http('127.0.0.1:8000', '/api/v1/memories/'));
    if (response.statusCode != 200) {
      throw Exception(jsonDecode(utf8.decode(response.bodyBytes)));
    }

    List memories = jsonDecode(utf8.decode(response.bodyBytes));
    return memories.map((data)=>Memory.fromJson(data)).toList();
  }

  Future<Memory> getMemoryById(int memoryId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/v1/memories/${memoryId}/'));
    if (response.statusCode != 200) { 
      throw Exception(response);
    }

    Map<String, dynamic> memory = jsonDecode(utf8.decode(response.bodyBytes));
    return Memory.fromJson(memory);
  }
}
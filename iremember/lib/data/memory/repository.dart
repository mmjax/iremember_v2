import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iremember/data/memory/models.dart';


class MemoryRepository {
  Future<List<Memory>> getMemories(String token) async {
    final response = await http.get(Uri.http('192.168.1.92:8000', '/api/v1/memories/'), headers: {"Authorization" : token});
    if (response.statusCode != 200) {
      throw Exception(jsonDecode(utf8.decode(response.bodyBytes)));
    }

    List memories = jsonDecode(utf8.decode(response.bodyBytes));
    return memories.map((data)=>Memory.fromJson(data)).toList();
  }

  Future<Memory> getMemoryById(int memoryId, String token) async {
    final response = await http.get(
      Uri.parse('http://192.168.1.92:8000/api/v1/memories/${memoryId}/'),
      headers: {"Authorization" : token},
    );
    if (response.statusCode != 200) { 
      throw Exception(response);
    }

    Map<String, dynamic> memory = jsonDecode(utf8.decode(response.bodyBytes));
    return Memory.fromJson(memory);
  }
}
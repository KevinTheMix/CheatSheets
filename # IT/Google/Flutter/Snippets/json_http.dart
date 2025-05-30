// Adapted from Pierian Training > 11. HTTP and Firebase > 002 HTTP Request

import 'dart:async';
import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final int id;
  final String title;
  const Album({required this.userId, required this.id, required this.title});

  // Follows best practice.
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}

Future<Album> fetchAlbum() async {
  // Authorization headers can be also added to this HTTP request (as second argument eg `headers: { HttpHeaders.authorizationHeader: {API_KEY} }`).
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if(response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failure to load Album');
  }
}

void main() async {
  Future<Album> future = fetchAlbum();
  Album album = await future;
  print('Album: ID=${album.id}, User=${album.userId}, Title=${album.title}');
}

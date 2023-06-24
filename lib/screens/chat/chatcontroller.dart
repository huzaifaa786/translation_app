import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:translation/api/api.dart';
import 'package:translation/helper/loading.dart';
import 'package:translation/models/contact.dart';
import 'package:translation/values/string.dart';
import 'package:get_storage/get_storage.dart';

class ChatController extends GetxController {
  static ChatController instance = Get.find();
  TextEditingController massage = TextEditingController();
  String? activeUserId;
  List<Contact> contacts = <Contact>[];
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  main() {
    var intValue = Random().nextInt(10);
    print('ffffffffffffffffffffffffffffffffff');
    print(intValue);
    return intValue;
  }

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    LoadingHelper.show();
    var url = BASE_URL + 'chat/auth';
    var data;
    GetStorage box = GetStorage();

    data = {
      'api_token': box.read('api_token')!,
      "socket_id": socketId,
      "channel_name": channelName,
    };
  
      var response = await Api.execute(url: url, data: data);
      LoadingHelper.dismiss();
      return response;
    
    
  }

  initPusher(String? id) async {
    try {
      await pusher.init(
          apiKey: "4341ec79756753dcfb7b",
          cluster: "ap2",
          onConnectionStateChange: onConnectionStateChange,
          onError: onError,
          onSubscriptionSucceeded: onSubscriptionSucceeded,
          onEvent: onEvent,
          onSubscriptionError: onSubscriptionError,
          onDecryptionFailure: onDecryptionFailure,
          onMemberAdded: onMemberAdded,
          onMemberRemoved: onMemberRemoved,
          onAuthorizer: onAuthorizer);
      await pusher.subscribe(channelName: "private-chatify.${id}");
      await pusher.connect();
    } catch (e) {
      print("error in initialization: $e");
    }
    print(pusher.connectionState);
  }

  getContacts() async {
    LoadingHelper.show();
    var url = BASE_URL + 'getContacts';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token')!,
    };
    var response = await Api.execute(url: url, data: data);
    contacts = <Contact>[];
    for (var contact in response['contacts']) {
      contacts.add(Contact(contact));
    }

    LoadingHelper.dismiss();
  }

  void onError(String message, int? code, dynamic e) {
    print("onError: $message code: $code exception: $e");
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    print("Connection: $currentState");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    print("onMemberRemoved: $channelName member: $member");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    print("onMemberAdded: $channelName member: $member");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    print("onSubscriptionSucceeded: $channelName data: $data");
  }

  void onSubscriptionError(String message, dynamic e) {
    print("onSubscriptionError: $message Exception: $e");
  }

  void onEvent(PusherEvent event) {
    print("onEvent: $event");
  }

  void onDecryptionFailure(String event, String reason) {
    print("onDecryptionFailure: $event reason: $reason");
  }

  subscribeActiveUserChannel(id) {
    activeUserId = id;
    var channelName = "private-chatify." + id;
    print(channelName);
    pusher.subscribe(channelName: channelName);
  }

  sendmassage() async {
    LoadingHelper.show();
    var url = BASE_URL + 'sendMessage';
    var data;
    GetStorage box = GetStorage();
    print(box.read('api_token'));
    data = {
      'api_token': box.read('api_token')!,
      'message': massage.text.toString(),
      'type': 'user',
      'temporaryMsgId': main(),
      'id': '3',
      'file': ''
    };
    var response = await Api.execute(url: url, data: data);

    LoadingHelper.dismiss();
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:logging/logging.dart';

class RoomListFilter extends StatelessWidget {

  final Function(Set<RoomStatus>) onToggleRoomStatusChange;
  final Function(String) onSearchTextChange;
  final Set<RoomStatus> roomStatusFilterSet;
  String searchString;

  RoomListFilter({
    required this.onToggleRoomStatusChange,
    required this.onSearchTextChange,
    required this.roomStatusFilterSet,
    required this.searchString
  });

  Logger log = Logger((RoomListFilter).toString());
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...RoomStatus.values.map((roomStatus){
            return Expanded(child: CheckboxListTile(
                tileColor  :  Room.getRoomStatusColor(roomStatus),
                title: Text(roomStatus.name),
                value: roomStatusFilterSet.contains(roomStatus),
                onChanged: (b) {
                  if(b == true) {
                    roomStatusFilterSet.add(roomStatus);
                  } else {
                    roomStatusFilterSet.remove(roomStatus);
                  }
                  onToggleRoomStatusChange(roomStatusFilterSet);
                }));
            // return Text(roomStatus.name);
          }),
          Expanded(child: TextField(
            controller: TextEditingController(text: searchString),
              decoration: const InputDecoration(
                hintText: 'Enter a search term',
              ),
              autofocus: true,
              onSubmitted: (newText) {
                onSearchTextChange(newText);
              },
          ))
        ]
    );

  }

}
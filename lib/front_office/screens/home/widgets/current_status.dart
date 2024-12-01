import 'dart:math';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:frontend/front_office/screens/home/widgets/room_list_filter.dart';
import 'package:frontend/front_office/screens/home/widgets/room_status_card.dart';

class CurrentStatus extends StatelessWidget {
  CurrentStatus({super.key}) {
    for (var i = 301; i < 400; i++) {
      roomList.add(Room.getRandomRoom(i.toString()));
    }
  }

  List<Room> roomList = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: [
               Container(
                 width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Inventory",
                            style: theme.textTheme.headlineSmall),
                        Divider(),
                        RoomListFilter(),
                        Divider(),
                        Wrap(
                          children: roomList.map((room) {
                            return RoomStatusCard(room: room);
                          }).toList()
                        )
                      ],
                    ),
                  ),
              ],
            )
          ],
        )
    );
  }

}
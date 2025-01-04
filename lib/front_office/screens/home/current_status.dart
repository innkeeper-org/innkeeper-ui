import 'dart:math';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/front_office/models/room.dart';
import 'package:frontend/front_office/screens/home/widgets/room_list_filter.dart';
import 'package:frontend/front_office/screens/home/widgets/room_status_card.dart';
import 'package:logging/logging.dart';

class CurrentStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CurrentStatusState();
}

class _CurrentStatusState extends State<CurrentStatus> {
  final log = Logger((CurrentStatus).toString());

  List<Room> roomList = [];
  Set<RoomStatus> roomStatusFilter = RoomStatus.values.toSet();
  String searchFilter = "";
  @override
  void initState() {
    for (var i = 301; i < 400; i++) {
      roomList.add(Room.getRandomRoom(i.toString()));
    }
    // roomStatusFilter.remove(RoomStatus.READY);
    super.initState();
  }

  void onRoomStatusChangeFilter(Set<RoomStatus> data) {
    setState(() {
      roomStatusFilter = data;
    });
  }

  void onSearchTextChangeFilter(String newFilter) {
    setState(() {
      searchFilter = newFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Room Inventory",
                style: theme.textTheme.headlineSmall),
            Divider(),
            // RoomListFilter(onToggleRoomStatusChange: onRoomStatusChangeFilter,
            //   onSearchTextChange: onSearchTextChangeFilter,
            //   roomStatusFilterSet: roomStatusFilter,
            //   searchString: searchFilter,),
            Divider(),
            Wrap(
                children: roomList.where((room) {
                  bool condition = roomStatusFilter.contains(room.status) &&
                      room.hasSearchText(searchFilter);
                  return condition;
                }).map((room) {
                  return RoomStatusCard(room: room);
                }).toList()
            )
          ],
        )
    );
  }
}


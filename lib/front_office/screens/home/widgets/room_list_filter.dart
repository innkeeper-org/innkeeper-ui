import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/front_office/models/room.dart';

class RoomListFilter extends StatelessWidget {
  const RoomListFilter({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...RoomStatus.values.map((roomStatus){
          return Expanded(child: CheckboxListTile(
              tileColor  : Room.getRoomStatusColor(roomStatus),
              title: Text(roomStatus.name),
              value: true,
              onChanged: (b){}));
         // return Text(roomStatus.name);
        }),
          Expanded(child: const TextField(decoration: InputDecoration(
            hintText: 'Enter a search term',
          )))
        ]
    );

  }

}
import 'package:flutter/material.dart';

class SettingsModal extends StatefulWidget {
  @override
  _SettingsModalState createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  bool light = false; // Biến lưu trạng thái của switch

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Switch(
                value: light,
                activeColor: Colors.blue,
                onChanged: (bool value) {
                  // Cập nhật trạng thái của switch
                  setState(() {
                    light = value;
                  });
                },
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Thay đổi giao diện',
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ngôn ngữ',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  )
                ],
              )),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Điều khoản và chính sách',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
          child: Row(
            children: [
              Text('모든 대중 음악 콘서트,',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
              ),
              Image.asset('assets/images/mocon_logo_dark.png', width: 80)
            ],
          ),
        ),
      ],
    );
  }
}

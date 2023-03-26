import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:books/config/route_app.dart' as route_app;

class WidgetAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        TextButton(
          onPressed: () {
            logout();

            Navigator.pushNamed(context, route_app.home);
          },
          child: const Text(
            'Logout',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ],
    );
  }

  Future<void> logout() async {
      await AuthService().logout();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

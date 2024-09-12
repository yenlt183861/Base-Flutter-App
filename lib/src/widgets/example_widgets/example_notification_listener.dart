// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class ExpampleNotificationListener extends StatelessWidget {
  const ExpampleNotificationListener({super.key});

  @override
  Widget build(BuildContext context) {
    return _ScrollNotificationExample();
  }
}

class _ScrollNotificationExample extends StatelessWidget {
  const _ScrollNotificationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          // invoked whenever a notification of the specified type (ScrollNotification in the example) is dispatched
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              print('Scrolling started');
            } else if (notification is ScrollUpdateNotification) {
              print('Scrolling... current position: ${notification.metrics.pixels}');
            } else if (notification is ScrollEndNotification) {
              print('Scrolling ended');
            }
            // stop the notification from bubbling up further in the widget tree, return true
            // return false, if to want to the notification continues to propagate to other ancestor widgets
            return true;
          },
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item $index'),
            ),
          ),
        ),
      ),
    );
  }
}

/// Example use custom notification with NotificationListener

class _CustomNotificationExample extends StatelessWidget {
  const _CustomNotificationExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<CustomNotification>(
          onNotification: (notification) {
            print('Received data: ${notification.message}');
            return true;
          },
          child: Center(
            child: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  CustomNotification('Hello from NotifyButton!').dispatch(context);
                },
                child: const Text('Gen a number'),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  final String message;
  CustomNotification(this.message);
}

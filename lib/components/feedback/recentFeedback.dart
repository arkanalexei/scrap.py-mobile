import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:scrappy/components/feedback/feedbackCard.dart';
import 'package:scrappy/model/feedbackItem.dart';

import '../../providers/constants.dart';

class RecentFeedback extends StatefulWidget {
  const RecentFeedback({Key? key}) : super(key: key);

  @override
  _RecentFeedbackState createState() => _RecentFeedbackState();
}

class _RecentFeedbackState extends State<RecentFeedback> {
  final _registerFeedbackFormKey = GlobalKey<FormState>();
  late final Future completedFuture;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var request = context.watch<CookieRequest>();
    completedFuture = request.get('$SITE_URL/about/json/');

    return FutureBuilder(
        future: completedFuture,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text("You have no past feedbacks. Send your feebacks now!"),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return WidgetsFromList(snapshot.data!);
            }
          }
        });
  }
}

Widget WidgetsFromList(List<dynamic> data) {
  List<Widget> arr = List<Widget>.generate(
    min(data.length, 4),
    (index) => FeedbackCard(
        feedback: FeedbackForm.fromJson(data[data.length - index - 1])),
  );
  return Column(children: arr);
}

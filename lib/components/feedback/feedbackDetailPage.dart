import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/model/feedbackItem.dart';

import '../../drawer.dart';

class FeedbackDetailPage extends StatelessWidget {
  const FeedbackDetailPage({
    super.key,
    required this.feedback,
  });

  final FeedbackForm feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PublicDrawer(),
      appBar: AppBar(
        title: Text('Feedback #${feedback.pk}'),
        backgroundColor: const Color(0xFF003320),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(80),
        child: Row(
          children: [
            // const BackButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const DepositHomePage()),
            //     );
            //   },
            // ),
            Expanded(
              flex: 2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40), // if you need this
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.25),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Padding(padding: EdgeInsets.all(25)),
                      
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children:[
                          Icon(Icons.person),
                          Text(' ${feedback.fields.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                        ]
                      ),

                      Text(
                        DateFormat('dd MMMM yyyy - hh:mm')
                            .format(feedback.fields.created_at),
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      
                      const Padding(padding: EdgeInsets.all(5)),
                      const Divider(thickness: 1, color: Colors.black),
                      const Padding(padding: EdgeInsets.all(5)),
                      
                      Text(
                        'Rated :',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      Text(
                        '${feedback.fields.star.toString()} Star',
                        style: TextStyle(fontSize: 18),
                      ),

                      const Padding(padding: EdgeInsets.all(5)),

                      Text(
                        'Message : ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      Text(
                        '${feedback.fields.message}',
                        style: TextStyle(fontSize: 18),
                      ),

                      const Padding(padding: EdgeInsets.all(5)),
                      const Divider(thickness: 1, color: Colors.black),
                      const Padding(padding: EdgeInsets.all(5)),

                      Text(
                        'Feedback #${feedback.pk} by user ${feedback.fields.user_id.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

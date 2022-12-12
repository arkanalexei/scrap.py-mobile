import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scrappy/components/feedback/feedbackDetailPage.dart';
import 'package:scrappy/model/feedbackItem.dart';

class FeedbackCard extends StatelessWidget {
  const FeedbackCard({
    super.key,
    required this.feedback,
  });

  final FeedbackForm feedback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FeedbackDetailPage(feedback: feedback)),
      ),
      child: SizedBox(
        height: 125,
        child: Card(
          elevation: 3.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children:[
                    Icon(Icons.person),
                    Text(' ${feedback.fields.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                  ]
                ),

                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children:[
                    Text(
                      'Rated ${feedback.fields.star.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Icon(Icons.star),
                    Text(' on ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),),
                    Text(DateFormat('dd MMMM yyyy').format(feedback.fields.created_at), style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),),
                  ]
                ),
                
                const Divider(),
                
                Text(
                  feedback.fields.message,
                  style: TextStyle(fontSize: 16),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:visitorsa/utils/app_localizations.dart';

class ReviewsContainer extends StatefulWidget {
  // List<Review> reviews;
  final int id;

  @override
  _ReviewsContainerState createState() => _ReviewsContainerState();

  // ReviewsContainer({this.id, this.reviews});
  ReviewsContainer({this.id});
}

class _ReviewsContainerState extends State<ReviewsContainer> {
  TextEditingController _commentController = new TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {},
              child: Card(
                color: Colors.white,
                elevation: 0.2,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 26,
                    color: Colors.lightBlueAccent,
                  ),
                  title: Text(
                    "name",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "comment",
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (value) {
//                                            _rating = value;
                      },
                      starCount: 5,
                      rating: 4,
                      size: 15.0,
                      isReadOnly: true,
                      color: Colors.deepOrangeAccent,
                      borderColor: Colors.deepOrangeAccent,
                      spacing: 0.0),
                ),
              ),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context).translate('add_review'),
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            )),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 5),
              child: Text(
                AppLocalizations.of(context).translate('rating'),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            SmoothStarRating(
                allowHalfRating: false,
                onRated: (value) {
                  _rating = value;
                },
                starCount: 5,
                rating: 0,
                size: 15.0,
                color: Colors.deepOrangeAccent,
                borderColor: Colors.deepOrangeAccent,
                spacing: 0.0),
          ],
        ),
        TextFormField(
          controller: _commentController,
          decoration: InputDecoration(
            hintText: 'type message here',
            fillColor: Colors.white,
            filled: true,
            contentPadding:
            EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // model.state == ViewState.Busy
        //     ? Container(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Center(
        //       child: CircularProgressIndicator(
        //         backgroundColor: Colors.lightBlue,
        //       ),
        //     ),
        //   ),
        // )
        //     :
        RaisedButton(
          child: Text(
            AppLocalizations.of(context).translate('submit'),
            style: TextStyle(color: Colors.white),
          ),
          color: Color(
              0xff24a041),
          onPressed: () async {
            // if (_commentController.text.isNotEmpty &&
            //     _rating != 0) {
            //   await model.addReview(
            //       widget.id,
            //       _commentController.text,
            //       _rating.toInt(),
            //       locator<AppLanguage>().appLocal.languageCode);
            //   if (model.addReviewResponse != null &&
            //       !model.addReviewResponse.status) {
            //     showToast(
            //         model.addReviewResponse.errors.toString(),
            //         Colors.red);
            //   }else if (model.addReviewResponse != null &&
            //       model.addReviewResponse.data != null) {
            //     widget.reviews.add(model.addReviewResponse.data.review);
            //     showToast(
            //         AppLocalizations.of(context).translate('sent_successfully'),
            //         Colors.green);
            //   }
            // } else {
            //   showToast(
            //       AppLocalizations.of(context)
            //           .translate('submit_warning'),
            //       Colors.red);
            // }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/colors.dart';
import '../../presentation/common/not_found.dart';
import '../../redux/app_selectors.dart';
import '../../redux/app_state.dart';

import 'view_model/review_view_model.dart';
import 'widgets/review_container.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key key}) : super(key: key);
  @override
  ReviewsScreenState createState() => ReviewsScreenState();
}

class ReviewsScreenState extends State<ReviewsScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ReviewViewModel>(
      builder: (context, vm) {
        return Scaffold(
          key: _globalKey,
          backgroundColor: white,
          appBar: _buildAppBarWidget(context),
          body: _buildScaffoldBody(vm),
        );
      },
      converter: ReviewViewModel.fromStore,
      distinct: true,
    );
  }

  Widget _buildScaffoldBody(ReviewViewModel vm) {
    return vm.reviews.length <= 0
        ? NotFound(
            info:
                "Sorry!, we couldn't find any reviews for this lecturer. Check back later.",
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: vm.reviews.length,
            itemBuilder: (BuildContext context, int index) {
              final theReviewUser =
                  getUser(vm.users.toList(), vm.reviews[index].userId);
              return ReviewContainer(
                review: vm.reviews[index],
                user: theReviewUser,
                course: getCourse(
                  vm.courses.toList(),
                  vm.reviews[index].courseId,
                ),
                globalKey: _globalKey,
              );
            },
            separatorBuilder: (context, index) => Divider(),
          );
  }

  Widget _buildAppBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: white,
      elevation: 0.5,
      title: Text(
        "Lecturer Reviews",
        style: TextStyle(color: black),
      ),
      iconTheme: IconThemeData(color: black),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Ionicons.close_outline,
          color: colorPrimary,
          size: 24.0,
        ),
      ),
    );
  }
}

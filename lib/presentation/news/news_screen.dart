import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/models/news.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/common/not_found.dart';
import 'package:lrsadmin/presentation/common/spinkit_loading_circle.dart';
import 'package:lrsadmin/presentation/news/arguments/add_news_faculty.dart';
import 'package:lrsadmin/redux/app_state.dart';
import '../../routes.dart';
import '../../utils/string_extension.dart';
import 'view_model.dart/news_view_model.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewsViewModel>(
      builder: (context, vm) {
        return Scaffold(
          key: _globalKey,
          appBar: _buildAppBarWidget(),
          body: _buildScaffoldBody(vm),
        );
      },
      converter: NewsViewModel.fromStore,
      distinct: true,
    );
  }

  Widget _buildAppBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "News",
        style: TextStyle(color: black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Ionicons.close_outline,
          color: colorPrimary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(Ionicons.add_outline, color: colorPrimary),
          onPressed: () async {
            final message =
                await Navigator.of(context).pushNamed(Routes.addNews);
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
      ],
    );
  }

  Widget _buildScaffoldBody(NewsViewModel vm) {
    return vm.news.length <= 0
        ? NotFound(
            info: "Sorry!, you haven't favorited any news",
          )
        : NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              itemCount: vm.news.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildNewsCard(
                  vm.news[index],
                  onPressedCallback: () async {
                    final message = await Navigator.of(context).pushNamed(
                      Routes.addNews,
                      arguments: AddNewsArgument(vm.news[index].uid),
                    );
                    if (message != null) {
                      showNoContextToast(successToastColor, message);
                    }
                  },
                );
              },
            ),
          );
  }

  Widget _buildNewsCard(News news, {Function onPressedCallback}) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressedCallback,
      child: Card(
        margin: EdgeInsets.only(bottom: 20.0),
        elevation: 5.0,
        shadowColor: Colors.black12,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: 150.0,
                child: CachedNetworkImage(
                  imageUrl: news.image,
                  placeholder: (context, url) => SpinkitLoadingCircle(),
                  errorWidget: (context, url, error) => Icon(
                    Ionicons.warning_outline,
                    color: red,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  "${news.title.capitalize()}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: AutoSizeText(
                  "${news.description.capitalize()}",
                  maxLines: 2,
                  minFontSize: 14,
                  maxFontSize: 14,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/common/student_container.dart';
import 'package:lrsadmin/redux/app_state.dart';

import '../search_view_model.dart';

class StudentsSearch extends SearchDelegate<String> {
  List<User> searchList;

  StudentsSearch(this.searchList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<User> searchResults = query.isEmpty
        ? searchList
        : searchList
            .where((User student) =>
                student.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return StoreConnector<AppState, SearchViewModel>(
      builder: (ctx, vm) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          itemCount: searchResults.length,
          itemBuilder: (BuildContext context, int index) {
            return StudentContainer(
              user: searchResults[index],
            );
          },
        );
      },
      converter: SearchViewModel.fromStore,
    );
  }
}

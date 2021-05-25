import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/presentation/common/lecturer_container.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/app_state.dart';

import '../search_view_model.dart';

class LecturersSearch extends SearchDelegate<String> {
  List<Lecturer> searchList;

  LecturersSearch(this.searchList);

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
    final List<Lecturer> searchResults = query.isEmpty
        ? searchList
        : searchList
            .where((Lecturer lecturer) =>
                lecturer.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return StoreConnector<AppState, SearchViewModel>(
      builder: (ctx, vm) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          itemCount: searchResults.length,
          itemBuilder: (BuildContext context, int index) {
            final faculty = getFaculty(
                vm.faculties.toList(), vm.lecturers[index].facultyId);
            final rating =
                getAverageRating(vm.reviews.toList(), vm.lecturers[index].uid);
            return LecturerContainer(
              lecturer: searchResults[index],
              faculty: faculty,
              rating: rating,
            );
          },
        );
      },
      converter: SearchViewModel.fromStore,
    );
  }
}

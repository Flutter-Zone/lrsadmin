// import 'package:flutter_example/pdf.dart';
// import 'package:intl/intl.dart';
import 'package:lrsadmin/models/comment.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/models/news.dart';
import 'package:lrsadmin/models/review.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/generate_report_view_model.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import '../../redux/app_selectors.dart';
import '../../utils/string_extension.dart';
import 'package:intl/intl.dart';

Future<String> generateReportPDF(context, GenerateReportViewModel vm,
    Map<String, dynamic> reportSettigs) async {
  List<Review> reviews = [];
  List<Comment> comments = [];
  // List<Lecturer> lecturers = [];
  // List<User> students = [];
  List<List<String>> data = [];
  String pdfTitle = "";

  String startDate = reportSettigs["startDate"];
  String endDate = reportSettigs["endDate"];
  String generateOn = reportSettigs["generateOn"];
  String generateOnValue = reportSettigs["generateOnValue"];
  int dataFormat = reportSettigs["dataFormat"];
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String fileName = "";

  if (generateOn == "Reviews") {
    if (dataFormat == 0) {
      reviews = filterReviews(vm.reviews.toList(), startDate, endDate);
    } else if (dataFormat == 1) {}
    if (startDate == endDate) {
      fileName = startDate;
      pdfTitle =
          "${reviews.length > 0 ? 'Reviews made on $startDate' : 'No $generateOn made on $startDate.'}";
    } else {
      fileName = "$startDate - $endDate";
      pdfTitle =
          "${reviews.length > 0 ? 'Reviews made between $startDate and $endDate' : 'No $generateOn made between $startDate and $endDate.'}";
    }
    data = <List<String>>[
      dataFormat == 0
          ? <String>[
              "Date",
              "Comment",
              "Lecturer",
              "Course",
              "Avg. Rate",
            ]
          : <String>[
              "Date",
              "Comment",
              "Lecturer",
              "Course",
              "Avg. Rate",
            ],
      ...reviews.map(
        (review) {
          final Lecturer lecturer =
              getLecturer(vm.lecturers.toList(), review.lecturerId);
          final Course course = getCourse(vm.courses.toList(), review.courseId);

          return dataFormat == 0
              ? [
                  formatter.format(review.createdAt.toDate()),
                  review.comment.capitalize(),
                  lecturer.name.capitalize(),
                  course.title.capitalize(),
                  review.rating.toString(),
                ]
              : [
                  formatter.format(review.createdAt.toDate()),
                  review.comment.capitalize(),
                  lecturer.name.capitalize(),
                  course.title.capitalize(),
                  review.rating.toString(),
                ];
        },
      ),
      dataFormat == 0
          ? <String>["Total Reviews", "", "", "", "", "${reviews.length}"]
          : <String>["Total Reviews", "", "", "", "${reviews.length}"]
    ];
  } else if (generateOn == "Comment") {
    comments = filterComments(vm.comments.toList(), startDate, endDate);
    if (startDate == endDate) {
      fileName = "$startDate";
      pdfTitle =
          "${comments.length > 0 ? 'Comments made on $startDate' : 'No $generateOn made on $startDate.'}";
    } else {
      fileName = "$startDate - $endDate";
      pdfTitle =
          "${comments.length > 0 ? 'Comments made between $startDate and $endDate' : 'No $generateOn made between $startDate and $endDate.'}";
    }
    data = <List<String>>[
      <String>[
        "Date",
        "Comment",
        "News title",
        "Student",
      ],
      ...comments.map(
        (comment) {
          final User student = getUser(vm.students.toList(), comment.userId);
          final News news = getNews(vm.news.toList(), comment.newsId);
          return [
            // "$count.",
            comment.createdAt.toDate().toIso8601String(),
            comment.comment,
            news.title,
            student.name,
          ];
        },
      ),
    ];
  } else if (generateOn == "Student") {
    reviews = getStudentReviews(
        vm.reviews.toList(), startDate, endDate, generateOnValue);
    final User student = getUser(vm.users.toList(), generateOnValue);
    if (startDate == endDate) {
      fileName = "${student.name}-$startDate";
      pdfTitle = reviews.length > 0
          ? 'Reviews made by ${student.name} on $startDate'
          : '${student.name} hasn\'t added any reviews on $startDate.';
    } else {
      fileName = "${student.name}-$startDate-$endDate";
      pdfTitle = reviews.length > 0
          ? 'Reviews made by ${student.name} between $startDate and $endDate'
          : '${student.name} hasn\'t added any reviews between $startDate and $endDate.';
    }
    data = <List<String>>[
      <String>[
        "Date",
        "Comment",
        "Lecturer",
        "Student",
        "Course",
        "Avg. Rate",
      ],
      ...reviews.map(
        (review) {
          final Lecturer lecturer =
              getLecturer(vm.lecturers.toList(), review.lecturerId);
          final Course course = getCourse(vm.courses.toList(), review.courseId);
          return [
            formatter.format(review.createdAt.toDate()),
            review.comment.capitalize(),
            lecturer.name.capitalize(),
            student.name.capitalize(),
            course.title.capitalize(),
            review.rating.toString(),
          ];
        },
      ),
    ];
  } else if (generateOn == "Lecturer") {
    reviews = getLecturerReviews(
        vm.reviews.toList(), startDate, endDate, generateOnValue);
    final Lecturer lecturer =
        getLecturer(vm.lecturers.toList(), generateOnValue);
    if (startDate == endDate) {
      fileName = "${lecturer.name} $startDate";
      pdfTitle = reviews.length > 0
          ? 'Reviews made on $startDate on ${lecturer.name}'
          : 'No Reviews made on ${lecturer.name} on $startDate.';
    } else {
      fileName = "${lecturer.name}-$startDate-$endDate";
      pdfTitle = reviews.length > 0
          ? 'Reviews made on ${lecturer.name} between $startDate and $endDate'
          : 'No Reviews made on ${lecturer.name} between $startDate and $endDate.';
    }
    data = <List<String>>[
      <String>[
        "Date",
        "Comment",
        "Lecturer",
        "Student",
        "Course",
        "Avg. Rate",
      ],
      ...reviews.map(
        (review) {
          final Lecturer lecturer =
              getLecturer(vm.lecturers.toList(), review.lecturerId);
          final User student = getUser(vm.users.toList(), review.userId);
          final Course course = getCourse(vm.courses.toList(), review.courseId);
          return [
            formatter.format(review.createdAt.toDate()),
            review.comment.capitalize(),
            lecturer.name.capitalize(),
            student.name.capitalize(),
            course.title.capitalize(),
            review.rating.toString(),
          ];
        },
      ),
    ];
  }

  final Document pdf = Document();

  pdf.addPage(
    MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
        // if (context.pageNumber == 1) {
        //   return null;
        // }
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(
                color: PdfColors.grey, style: BorderStyle.solid, width: 0.5),
          )),
          child: Text(
            'Data Analysis Report',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      footer: (Context context) {
        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: Text(
            'Page ${context.pageNumber} of ${context.pagesCount}',
            style: Theme.of(context)
                .defaultTextStyle
                .copyWith(color: PdfColors.grey),
          ),
        );
      },
      build: (Context context) => <Widget>[
        Header(
          level: 0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Regent University College', textScaleFactor: 2),
                Padding(padding: const EdgeInsets.only(bottom: 5)),
                Text('${generateOn.capitalize()} Analysis', textScaleFactor: 1),
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.all(10)),
        Paragraph(text: pdfTitle),
        Table.fromTextArray(
          context: context,
          data: data,
        ),
      ],
    ),
  );
  //save PDF

  final dir = await getExternalStorageDirectory();
  final String path = '${dir.path}/$generateOn: $fileName.pdf';
  final File file = File(path);
  file.writeAsBytesSync(await pdf.save());
  return Future.value(path);
}

import 'dart:ui';

const primaryColor = Color(0xff100B20);
const String homeView = '/';
const String detailsView = '/detailsView';
const String searchView = '/searchView';
const String gtSectraFine = 'GT Sectra Fine';
const String baseURL = 'https://www.googleapis.com/books/v1/';
const String newestEndPoint =
    'volumes?q=subject:programming&sorting=newest&filtering=free-ebooks';
const String featuresdEndPoint = 'volumes?q=programing&filtering=free-ebooks';
const String similarBooksEndPoint =
    'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming';

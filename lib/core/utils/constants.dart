import 'dart:ui';

const primaryColor = Color(0xff100B20);

const String homeView = '/';
const String detailsView = '/detailsView';

const String gtSectraFine = 'GT Sectra Fine';

const String baseURL = 'https://www.googleapis.com/books/v1/';
const String apiKey = 'AIzaSyAjtKUAPHLcMPBlKxiRz8TiEdB-FAnF2OM';

const String newestEndPoint =
    'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science';

const String featuredEndPoint = 'volumes?q=programming&filter=free-ebooks';

const String similarBooksEndPoint =
    'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming';

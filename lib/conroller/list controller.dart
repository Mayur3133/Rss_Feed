import 'package:get/get.dart';

import '../midal.dart';

class typecontroller extends GetxController {
  RxString selectedcntry = "India".obs;
  RxString selectedMediaType = "Music".obs;
  RxString selectedfeed = "Most Played".obs;
  RxString selectedType = "Albums".obs;
  RxList responsedata = <Results>[].obs;

  RxList typeList = ['Albums', 'Music Videos', 'Playlists', 'Songs'].obs;
  RxMap feedList = {'Most Played': 'most-played'}.obs;

  selectNewMedia(String v) {
    typeList.value = mediaTypes
        .singleWhere((element) => element['name'] == v.toString())['types'];
    feedList.value = mediaTypes
        .singleWhere((element) => element['name'] == v.toString())['feed'];
    selectedType.value = typeList.value.first;
    selectedfeed.value = feedList.value.keys.first;
    feedList.refresh();
    typeList.refresh();
  }

  Map<String, String> cntry = {
    "Unites State": "us",
    "India": "in",
    "United Kingdom": "gb",
  };

  RxString selectedItemCount = "10".obs;
  List<String> showItemsonpageList = [
    '10',
    '25',
    '50',
  ];

  List<Map<String, dynamic>> mediaTypes = [
    {
      'name': 'Music',
      'types': ['Albums', 'Music Videos', 'Playlists', 'Songs'],
      'feed': {'Most Played': 'most-played'}
    },
    {
      'name': 'Podcasts',
      'types': <String>['Podcasts', 'Podcast Episodes'],
      'feed': <String, String>{'Top': 'top'}
    },
    {
      'name': 'Apps',
      'types': <String>['Apps'],
      'feed': <String, String>{'Top Free': 'top-free', 'Top Paid': 'top-paid'}
    },
    {
      'name': 'Books',
      'types': <String>['Books'],
      'feed': <String, String>{'Top Free': 'top-free', 'Top Paid': 'top-paid'}
    },
    {
      'name': 'Audio Books',
      'types': <String>['Audio Books'],
      'feed': <String, String>{
        'Top': 'top',
        'Everyday listens for \$9.99.': '1355215958',
        '\$9.99 Fiction & Literature': '1461817928',
        '\$9.99 Mysteries & Thrillers': '1461817926',
        '\$9.99 Nonfiction': '1461817931',
        '\$9.99 Biographies & Memoirs': '1461817929',
        '\$9.99 Business & Self-Development': '1461817927',
        '\$9.99 Romance': '1461817933',
        '\$9.99 Sci-Fi & Fantasy': '1461817932',
        '\$9.99 Kids & Young Adults': '1461817930',
      }
    },
  ];
}

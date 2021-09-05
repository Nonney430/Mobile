/*
  1กค-5533-57
  2กค-6087-61
  3กค-6230-41
  4กค-5916-44
  5กค-6166-50
*/
void main() {
  const KEY_DATE = 'date';


  List<Map<String, dynamic>> reportList = [
    {KEY_DATE: '1กค', 'case': 5533, 'death': 57},
    {KEY_DATE: '2กค', 'case': 6087, 'death': 61},
    {KEY_DATE: '3กค', 'case': 6230, 'death': 41},
    {KEY_DATE: '4กค', 'case': 5916, 'death': 44},
    {KEY_DATE: '5กค', 'case': 6166, 'death': 50},
  ];

  /*for (var i = 0; i < reportMap.length; i++) {
    print(
        'วันที่ ${reportMap[i][KEY_DATE]}, ติดเชื้อ ${reportMap[i]['case']}, เสียชีวิต ${reportMap[i]['death']}');
  }*/
  /*reportList.forEach((Map<String, dynamic> item) {
    print('วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}');
  });*/

}

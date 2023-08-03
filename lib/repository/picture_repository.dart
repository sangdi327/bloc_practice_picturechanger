class PictureRepository {
  List<String> pictures = ['beach.jpg', 'mountain.jpg', 'river.jpg'];
  List<int> delay = [2000, 1500, 2500];

  Future<String> getLandscape(int index) async {
    print(index % 3);
    await Future.delayed(Duration(milliseconds: delay[index % 3]));
    print('result : ${pictures[index % 3]}');
    return pictures[index % 3];
  }
}

void main() {
  final List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final someMap = <int, int?>{};
  for (var e in myList) {
    someMap[e] = (someMap.putIfAbsent(e, () => 0))! + 1;
  }
 

}

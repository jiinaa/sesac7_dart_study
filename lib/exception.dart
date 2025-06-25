
void main() {
  // final numString = '10.5';
}

checkNum(e) {
  final String numString = e; 

  try {
    int num = int.parse(numString);
    print('실행시 num: $num');
    return num;
  } catch (e) {
    int num = 0;
    print('에러시 num: $num');
    return num; 
  }
}
 
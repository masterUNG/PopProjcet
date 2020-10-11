class MyAPI {
  String checkNull(String string) {
    String checkString = string;
    if (checkString == null) {
      checkString = 'n/a';
    }
    return checkString;
  }

  MyAPI();
}

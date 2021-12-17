String formateTime(int second) {
  String timeText = '';
  timeText = second < 10
      ? "00:0${second}"
      : second < 60
          ? "00:${second}"
          : "${second ~/ 60}:${second % 60 < 10 ? '0${second % 60}' : '${second % 60}'}";
  return timeText;
}

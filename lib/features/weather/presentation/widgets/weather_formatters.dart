const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String formatTemp(double celsius) => '${celsius.round()}°';

String formatHour(DateTime time) =>
    '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

String formatWeekday(DateTime date) => _weekdays[date.weekday - 1];

String formatDateTime(DateTime time) =>
    '${formatWeekday(time)}, ${time.day} ${_months[time.month - 1]} · ${formatHour(time)}';

String capitalize(String text) =>
    text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1)}';

class InnerHueDateUtils {
  const InnerHueDateUtils._();

  static const _months = [
    '',
    'Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran',
    'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık',
  ];

  static String formatTurkish(DateTime date) =>
      '${date.day} ${_months[date.month]} ${date.year}';
}

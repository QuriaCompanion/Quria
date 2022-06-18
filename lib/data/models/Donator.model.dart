class Donator {
  final int support_id;
  final String supporter_name;
  final String? support_note;
  final int support_coffees;

  const Donator({
    required this.support_id,
    required this.supporter_name,
    required this.support_note,
    required this.support_coffees,
  });

  factory Donator.fromJson(Map<String, dynamic> json) {
    return Donator(
      support_id: json['support_id'],
      supporter_name: json['supporter_name'],
      support_note: json['support_note'],
      support_coffees: json['support_coffees'],
    );
  }
  static List<Donator> fromJsonList(Map<String, dynamic> jsonList) {
    List<Donator> donators = [];
    jsonList['data'].forEach((e) {
      donators.add(Donator.fromJson(e));
    });
    return donators;
  }
}

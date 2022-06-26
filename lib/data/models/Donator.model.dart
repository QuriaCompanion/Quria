class Donator {
  final int supportId;
  final String supporterName;
  final String? supportNote;
  final int supportCoffees;

  const Donator({
    required this.supportId,
    required this.supporterName,
    required this.supportNote,
    required this.supportCoffees,
  });

  factory Donator.fromJson(Map<String, dynamic> json) {
    return Donator(
      supportId: json['support_id'],
      supporterName: json['supporter_name'],
      supportNote: json['support_note'],
      supportCoffees: json['support_coffees'],
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

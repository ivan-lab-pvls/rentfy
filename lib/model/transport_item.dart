enum EState {
  perfect("Perfect"),
  average("Average"),
  bad("Bad");

  const EState(this.text);
  final String text;
}

class TransportItem {
  String? id;
  String? name;
  String? type;
  EState? state;
  String? number;
  String? comment;
  double? rentalCost;
  double? valueOfDeposit;

  TransportItem(
      {this.id,
      this.name,
      this.type,
      this.rentalCost,
      this.number,
      this.valueOfDeposit,
      this.comment,
      this.state});

  factory TransportItem.fromJson(Map<String, dynamic> parsedJson) {
    return TransportItem(
      id: parsedJson['id'] ?? "",
      name: parsedJson['name'] ?? "",
      type: parsedJson['type'] ?? "",
      number: parsedJson['number'] ?? "",
      comment: parsedJson['comment'] ?? "",
      rentalCost: parsedJson['rentalCost'],
      state: EState.values.byName(parsedJson['state']),
      valueOfDeposit: parsedJson['valueOfDeposit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "rentalCost": rentalCost,
      "type": type,
      "comment": comment,
      "number": number,
      "state": state!.name,
      "valueOfDeposit": valueOfDeposit
    };
  }
}

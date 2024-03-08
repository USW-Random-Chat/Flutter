class Message {
  final String roomId;
  final String sender;
  final String contents;

  Message({required this.roomId, required this.sender, required this.contents});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      roomId: json['roomId'],
      sender: json['sender'],
      contents: json['contents'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'sender': sender,
      'contents': contents,
    };
  }
}

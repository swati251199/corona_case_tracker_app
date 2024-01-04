class ModalDemo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ModalDemo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  ModalDemo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'] as int?;
    id = json['id'] as int?;
    title = json['title'] as String?;
    url = json['url'] as String?;
    thumbnailUrl = json['thumbnailUrl'] as String?;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> json = <String, dynamic>{};
  //   json['albumId'] = albumId;
  //   json['id'] = id;
  //   json['title'] = title;
  //   json['url'] = url;
  //   json['thumbnailUrl'] = thumbnailUrl;
  //   return json;
  // }
}

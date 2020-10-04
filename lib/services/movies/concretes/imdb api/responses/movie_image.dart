import 'dart:convert';

class MovieImage {
    MovieImage({
        this.caption,
        this.createdOn,
        this.height,
        this.id,
        this.url,
        this.width,
        this.source,
        this.type,
    });

    String caption;
    DateTime createdOn;
    int height;
    String id;
    String url;
    int width;
    String source;
    String type;

    factory MovieImage.fromRawJson(String str) => MovieImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieImage.fromJson(Map<String, dynamic> json) => MovieImage(
        caption: json["caption"] == null ? null : json["caption"],
        createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
        height: json["height"] == null ? null : json["height"],
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
        source: json["source"] == null ? null : json["source"],
        type: json["type"] == null ? null : json["type"],
    );

    Map<String, dynamic> toJson() => {
        "caption": caption == null ? null : caption,
        "createdOn": createdOn == null ? null : createdOn.toIso8601String(),
        "height": height == null ? null : height,
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
        "source": source == null ? null : source,
        "type": type == null ? null : type,
    };
}

import 'dart:convert';

class Rating {
    Rating({
        this.source,
        this.value,
    });

    String source;
    String value;

    factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"] == null ? null : json["Source"],
        value: json["Value"] == null ? null : json["Value"],
    );

    Map<String, dynamic> toJson() => {
        "Source": source == null ? null : source,
        "Value": value == null ? null : value,
    };
}
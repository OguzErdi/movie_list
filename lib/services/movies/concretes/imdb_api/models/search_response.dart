// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

class SearchResponse {
    SearchResponse({
        this.meta,
        this.type,
        this.query,
        this.results,
        this.types,
    });

    Meta meta;
    String type;
    String query;
    List<Movie> results;
    List<String> types;

    factory SearchResponse.fromRawJson(String str) => SearchResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        meta: json["@meta"] == null ? null : Meta.fromJson(json["@meta"]),
        type: json["@type"] == null ? null : json["@type"],
        query: json["query"] == null ? null : json["query"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "@meta": meta == null ? null : meta.toJson(),
        "@type": type == null ? null : type,
        "query": query == null ? null : query,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
    };
}

class Meta {
    Meta({
        this.operation,
        this.requestId,
        this.serviceTimeMs,
    });

    String operation;
    String requestId;
    double serviceTimeMs;

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        operation: json["operation"] == null ? null : json["operation"],
        requestId: json["requestId"] == null ? null : json["requestId"],
        serviceTimeMs: json["serviceTimeMs"] == null ? null : json["serviceTimeMs"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "operation": operation == null ? null : operation,
        "requestId": requestId == null ? null : requestId,
        "serviceTimeMs": serviceTimeMs == null ? null : serviceTimeMs,
    };
}

class Movie {
    Movie({
        this.id,
        this.image,
        this.runningTimeInMinutes,
        this.title,
        this.titleType,
        this.year,
        this.principals,
        this.akas,
        this.legacyNameText,
        this.name,
        this.knownFor,
        this.disambiguation,
        this.nextEpisode,
        this.numberOfEpisodes,
        this.seriesEndYear,
        this.seriesStartYear,
    });

    String id;
    MovieImage image;
    int runningTimeInMinutes;
    String title;
    ResultTitleType titleType;
    int year;
    List<Principal> principals;
    List<String> akas;
    String legacyNameText;
    String name;
    List<KnownFor> knownFor;
    String disambiguation;
    String nextEpisode;
    int numberOfEpisodes;
    int seriesEndYear;
    int seriesStartYear;

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : MovieImage.fromJson(json["image"]),
        runningTimeInMinutes: json["runningTimeInMinutes"] == null ? null : json["runningTimeInMinutes"],
        title: json["title"] == null ? null : json["title"],
        titleType: json["titleType"] == null ? null : resultTitleTypeValues.map[json["titleType"]],
        year: json["year"] == null ? null : json["year"],
        principals: json["principals"] == null ? null : List<Principal>.from(json["principals"].map((x) => Principal.fromJson(x))),
        akas: json["akas"] == null ? null : List<String>.from(json["akas"].map((x) => x)),
        legacyNameText: json["legacyNameText"] == null ? null : json["legacyNameText"],
        name: json["name"] == null ? null : json["name"],
        knownFor: json["knownFor"] == null ? null : List<KnownFor>.from(json["knownFor"].map((x) => KnownFor.fromJson(x))),
        disambiguation: json["disambiguation"] == null ? null : json["disambiguation"],
        nextEpisode: json["nextEpisode"] == null ? null : json["nextEpisode"],
        numberOfEpisodes: json["numberOfEpisodes"] == null ? null : json["numberOfEpisodes"],
        seriesEndYear: json["seriesEndYear"] == null ? null : json["seriesEndYear"],
        seriesStartYear: json["seriesStartYear"] == null ? null : json["seriesStartYear"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image.toJson(),
        "runningTimeInMinutes": runningTimeInMinutes == null ? null : runningTimeInMinutes,
        "title": title == null ? null : title,
        "titleType": titleType == null ? null : resultTitleTypeValues.reverse[titleType],
        "year": year == null ? null : year,
        "principals": principals == null ? null : List<dynamic>.from(principals.map((x) => x.toJson())),
        "akas": akas == null ? null : List<dynamic>.from(akas.map((x) => x)),
        "legacyNameText": legacyNameText == null ? null : legacyNameText,
        "name": name == null ? null : name,
        "knownFor": knownFor == null ? null : List<dynamic>.from(knownFor.map((x) => x.toJson())),
        "disambiguation": disambiguation == null ? null : disambiguation,
        "nextEpisode": nextEpisode == null ? null : nextEpisode,
        "numberOfEpisodes": numberOfEpisodes == null ? null : numberOfEpisodes,
        "seriesEndYear": seriesEndYear == null ? null : seriesEndYear,
        "seriesStartYear": seriesStartYear == null ? null : seriesStartYear,
    };
}

class MovieImage {
    MovieImage({
        this.height,
        this.id,
        this.url,
        this.width,
    });

    int height;
    String id;
    String url;
    int width;

    factory MovieImage.fromRawJson(String str) => MovieImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieImage.fromJson(Map<String, dynamic> json) => MovieImage(
        height: json["height"] == null ? null : json["height"],
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
    };
}

class KnownFor {
    KnownFor({
        this.crew,
        this.summary,
        this.id,
        this.title,
        this.titleType,
        this.year,
        this.disambiguation,
        this.cast,
    });

    List<Crew> crew;
    Summary summary;
    String id;
    String title;
    KnownForTitleType titleType;
    int year;
    String disambiguation;
    List<Cast> cast;

    factory KnownFor.fromRawJson(String str) => KnownFor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        crew: json["crew"] == null ? null : List<Crew>.from(json["crew"].map((x) => Crew.fromJson(x))),
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        titleType: json["titleType"] == null ? null : knownForTitleTypeValues.map[json["titleType"]],
        year: json["year"] == null ? null : json["year"],
        disambiguation: json["disambiguation"] == null ? null : json["disambiguation"],
        cast: json["cast"] == null ? null : List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "crew": crew == null ? null : List<dynamic>.from(crew.map((x) => x.toJson())),
        "summary": summary == null ? null : summary.toJson(),
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "titleType": titleType == null ? null : knownForTitleTypeValues.reverse[titleType],
        "year": year == null ? null : year,
        "disambiguation": disambiguation == null ? null : disambiguation,
        "cast": cast == null ? null : List<dynamic>.from(cast.map((x) => x.toJson())),
    };
}

class Cast {
    Cast({
        this.billing,
        this.category,
        this.characters,
        this.roles,
        this.castAs,
        this.endYear,
        this.episodeCount,
        this.startYear,
    });

    int billing;
    Category category;
    List<String> characters;
    List<CastRole> roles;
    String castAs;
    int endYear;
    int episodeCount;
    int startYear;

    factory Cast.fromRawJson(String str) => Cast.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        billing: json["billing"] == null ? null : json["billing"],
        category: json["category"] == null ? null : categoryValues.map[json["category"]],
        characters: json["characters"] == null ? null : List<String>.from(json["characters"].map((x) => x)),
        roles: json["roles"] == null ? null : List<CastRole>.from(json["roles"].map((x) => CastRole.fromJson(x))),
        castAs: json["as"] == null ? null : json["as"],
        endYear: json["endYear"] == null ? null : json["endYear"],
        episodeCount: json["episodeCount"] == null ? null : json["episodeCount"],
        startYear: json["startYear"] == null ? null : json["startYear"],
    );

    Map<String, dynamic> toJson() => {
        "billing": billing == null ? null : billing,
        "category": category == null ? null : categoryValues.reverse[category],
        "characters": characters == null ? null : List<dynamic>.from(characters.map((x) => x)),
        "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x.toJson())),
        "as": castAs == null ? null : castAs,
        "endYear": endYear == null ? null : endYear,
        "episodeCount": episodeCount == null ? null : episodeCount,
        "startYear": startYear == null ? null : startYear,
    };
}

enum Category { ACTOR, ACTRESS, SELF }

final categoryValues = EnumValues({
    "actor": Category.ACTOR,
    "actress": Category.ACTRESS,
    "self": Category.SELF
});

class CastRole {
    CastRole({
        this.character,
    });

    String character;

    factory CastRole.fromRawJson(String str) => CastRole.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CastRole.fromJson(Map<String, dynamic> json) => CastRole(
        character: json["character"] == null ? null : json["character"],
    );

    Map<String, dynamic> toJson() => {
        "character": character == null ? null : character,
    };
}

class Crew {
    Crew({
        this.category,
        this.job,
    });

    String category;
    String job;

    factory Crew.fromRawJson(String str) => Crew.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        category: json["category"] == null ? null : json["category"],
        job: json["job"] == null ? null : json["job"],
    );

    Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "job": job == null ? null : job,
    };
}

class Summary {
    Summary({
        this.category,
        this.displayYear,
        this.characters,
    });

    String category;
    String displayYear;
    List<String> characters;

    factory Summary.fromRawJson(String str) => Summary.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        category: json["category"] == null ? null : json["category"],
        displayYear: json["displayYear"] == null ? null : json["displayYear"],
        characters: json["characters"] == null ? null : List<String>.from(json["characters"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
        "displayYear": displayYear == null ? null : displayYear,
        "characters": characters == null ? null : List<dynamic>.from(characters.map((x) => x)),
    };
}

enum KnownForTitleType { MOVIE, TV_SERIES, SHORT }

final knownForTitleTypeValues = EnumValues({
    "movie": KnownForTitleType.MOVIE,
    "short": KnownForTitleType.SHORT,
    "tvSeries": KnownForTitleType.TV_SERIES
});

class Principal {
    Principal({
        this.id,
        this.legacyNameText,
        this.name,
        this.billing,
        this.category,
        this.characters,
        this.roles,
        this.disambiguation,
        this.endYear,
        this.episodeCount,
        this.startYear,
        this.principalAs,
        this.attr,
    });

    String id;
    String legacyNameText;
    String name;
    int billing;
    Category category;
    List<String> characters;
    List<PrincipalRole> roles;
    String disambiguation;
    int endYear;
    int episodeCount;
    int startYear;
    String principalAs;
    List<String> attr;

    factory Principal.fromRawJson(String str) => Principal.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Principal.fromJson(Map<String, dynamic> json) => Principal(
        id: json["id"] == null ? null : json["id"],
        legacyNameText: json["legacyNameText"] == null ? null : json["legacyNameText"],
        name: json["name"] == null ? null : json["name"],
        billing: json["billing"] == null ? null : json["billing"],
        category: json["category"] == null ? null : categoryValues.map[json["category"]],
        characters: json["characters"] == null ? null : List<String>.from(json["characters"].map((x) => x)),
        roles: json["roles"] == null ? null : List<PrincipalRole>.from(json["roles"].map((x) => PrincipalRole.fromJson(x))),
        disambiguation: json["disambiguation"] == null ? null : json["disambiguation"],
        endYear: json["endYear"] == null ? null : json["endYear"],
        episodeCount: json["episodeCount"] == null ? null : json["episodeCount"],
        startYear: json["startYear"] == null ? null : json["startYear"],
        principalAs: json["as"] == null ? null : json["as"],
        attr: json["attr"] == null ? null : List<String>.from(json["attr"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "legacyNameText": legacyNameText == null ? null : legacyNameText,
        "name": name == null ? null : name,
        "billing": billing == null ? null : billing,
        "category": category == null ? null : categoryValues.reverse[category],
        "characters": characters == null ? null : List<dynamic>.from(characters.map((x) => x)),
        "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x.toJson())),
        "disambiguation": disambiguation == null ? null : disambiguation,
        "endYear": endYear == null ? null : endYear,
        "episodeCount": episodeCount == null ? null : episodeCount,
        "startYear": startYear == null ? null : startYear,
        "as": principalAs == null ? null : principalAs,
        "attr": attr == null ? null : List<dynamic>.from(attr.map((x) => x)),
    };
}

class PrincipalRole {
    PrincipalRole({
        this.character,
        this.characterId,
    });

    String character;
    String characterId;

    factory PrincipalRole.fromRawJson(String str) => PrincipalRole.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PrincipalRole.fromJson(Map<String, dynamic> json) => PrincipalRole(
        character: json["character"] == null ? null : json["character"],
        characterId: json["characterId"] == null ? null : json["characterId"],
    );

    Map<String, dynamic> toJson() => {
        "character": character == null ? null : character,
        "characterId": characterId == null ? null : characterId,
    };
}

enum ResultTitleType { VIDEO, MOVIE, TV_SERIES }

final resultTitleTypeValues = EnumValues({
    "movie": ResultTitleType.MOVIE,
    "tvSeries": ResultTitleType.TV_SERIES,
    "video": ResultTitleType.VIDEO
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

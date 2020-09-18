import "director.dart";
import "actor.dart";

class Movie  {
	String name;
	Director director;
	int year;
	List<Actor> actor;

	Movie({this.name, this.director, this.year, this.actor});

	factory Movie.fromJson(Map<String, dynamic> json) {
		return Movie(
			name: json['name'],
			director: json['director'] != null ? new Director.fromJson(json['director']) : null,
			year: json['year'],
			actor: json['actor'] != null ? json['actor'].map((v) => new Actor.fromJson(v)).toList() : null,
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		if (this.director != null) {
      data['director'] = this.director.toJson();
    }
		data['year'] = this.year;
		if (this.actor!= null) {
      data['actor'] = this.actor.map((v) => v.toJson()).toList();
    }
		return data;
	}


}

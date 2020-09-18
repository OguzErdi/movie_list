class Director  {
	String name;

	Director({this.name});

	factory Director.fromJson(Map<String, dynamic> json) {
		return Director(
			name: json['name'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		return data;
	}


}

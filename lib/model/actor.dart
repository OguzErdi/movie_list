class Actor  {
	String name;
	String role;

	Actor({this.name, this.role});

	factory Actor.fromJson(Map<String, dynamic> json) {
		return Actor(
			name: json['name'],
			role: json['role'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['role'] = this.role;
		return data;
	}


}

class AiModels {
    AiModels({
        required this.name,
        required this.score,
    });

    final String name;
    final String score;

    factory AiModels.fromJson(Map<String, dynamic> json){ 
        return AiModels(
            name: json["name"] ?? "",
            score: json["score"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "score": score,
    };

}

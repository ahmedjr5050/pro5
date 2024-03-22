class WeatherModels {
  WeatherModels({
    required this.location,
    required this.current,
  });

  final Location? location;
  final Current? current;

  factory WeatherModels.fromJson(Map<String, dynamic> json) {
    return WeatherModels(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      current:
          json["current"] == null ? null : Current.fromJson(json["current"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
      };

  @override
  String toString() {
    return "$location, $current, ";
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    required this.airQuality,
  });

  final num? lastUpdatedEpoch;
  final String? lastUpdated;
  final num? tempC;
  final num? tempF;
  final num? isDay;
  final Condition? condition;
  final num? windMph;
  final num? windKph;
  final num? windDegree;
  final String? windDir;
  final num? pressureMb;
  final num? pressureIn;
  final num? precipMm;
  final num? precipIn;
  final int? humidity;
  final num? cloud;
  final num? feelslikeC;
  final num? feelslikeF;
  final num? visKm;
  final num? visMiles;
  final num? uv;
  final num? gustMph;
  final num? gustKph;
  final Map<String, num> airQuality;

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json["last_updated_epoch"],
      lastUpdated: json["last_updated"],
      tempC: json["temp_c"],
      tempF: json["temp_f"],
      isDay: json["is_day"],
      condition: json["condition"] == null
          ? null
          : Condition.fromJson(json["condition"]),
      windMph: json["wind_mph"],
      windKph: json["wind_kph"],
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressureMb: json["pressure_mb"],
      pressureIn: json["pressure_in"],
      precipMm: json["precip_mm"],
      precipIn: json["precip_in"],
      humidity: json["humidity"],
      cloud: json["cloud"],
      feelslikeC: json["feelslike_c"],
      feelslikeF: json["feelslike_f"],
      visKm: json["vis_km"],
      visMiles: json["vis_miles"],
      uv: json["uv"],
      gustMph: json["gust_mph"],
      gustKph: json["gust_kph"],
      airQuality: Map.from(json["air_quality"])
          .map((k, v) => MapEntry<String, num>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "air_quality":
            Map.from(airQuality).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  @override
  String toString() {
    return "$lastUpdatedEpoch, $lastUpdated, $tempC, $tempF, $isDay, $condition, $windMph, $windKph, $windDegree, $windDir, $pressureMb, $pressureIn, $precipMm, $precipIn, $humidity, $cloud, $feelslikeC, $feelslikeF, $visKm, $visMiles, $uv, $gustMph, $gustKph, $airQuality, ";
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String? text;
  final String? icon;
  final num? code;

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
        "code": code,
      };

  @override
  String toString() {
    return "$text, $icon, $code, ";
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String? name;
  final String? region;
  final String? country;
  final num? lat;
  final num? lon;
  final String? tzId;
  final num? localtimeEpoch;
  final String? localtime;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      region: json["region"],
      country: json["country"],
      lat: json["lat"],
      lon: json["lon"],
      tzId: json["tz_id"],
      localtimeEpoch: json["localtime_epoch"],
      localtime: json["localtime"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };

  @override
  String toString() {
    return "$name, $region, $country, $lat, $lon, $tzId, $localtimeEpoch, $localtime, ";
  }
}

/*
{
	"location": {
		"name": "Cairo",
		"region": "Al Qahirah",
		"country": "Egypt",
		"lat": 30.05,
		"lon": 31.25,
		"tz_id": "Africa/Cairo",
		"localtime_epoch": 1709394688,
		"localtime": "2024-03-02 17:51"
	},
	"current": {
		"last_updated_epoch": 1709394300,
		"last_updated": "2024-03-02 17:45",
		"temp_c": 23,
		"temp_f": 73.4,
		"is_day": 1,
		"condition": {
			"text": "Sunny",
			"icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
			"code": 1000
		},
		"wind_mph": 12.5,
		"wind_kph": 20.2,
		"wind_degree": 310,
		"wind_dir": "NW",
		"pressure_mb": 1015,
		"pressure_in": 29.97,
		"precip_mm": 0,
		"precip_in": 0,
		"humidity": 29,
		"cloud": 0,
		"feelslike_c": 22.6,
		"feelslike_f": 72.7,
		"vis_km": 10,
		"vis_miles": 6,
		"uv": 6,
		"gust_mph": 18.4,
		"gust_kph": 29.6,
		"air_quality": {
			"co": 237,
			"no2": 3,
			"o3": 100.1,
			"so2": 3.2,
			"pm2_5": 20.7,
			"pm10": 101,
			"us-epa-index": 2,
			"gb-defra-index": 2
		}
	}
}*/
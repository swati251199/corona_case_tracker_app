class CountryData {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  num? activePerOneMillion;
  num? recoveredPerOneMillion;
  num? criticalPerOneMillion;

  CountryData({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  CountryData.fromJson(Map<String, dynamic> json) {
    updated = json['updated'] as int?;
    country = json['country'] as String?;
    countryInfo = (json['countryInfo'] as Map<String,dynamic>?) != null ? CountryInfo.fromJson(json['countryInfo'] as Map<String,dynamic>) : null;
    cases = json['cases'] as int?;
    todayCases = json['todayCases'] as int?;
    deaths = json['deaths'] as int?;
    todayDeaths = json['todayDeaths'] as int?;
    recovered = json['recovered'] as int?;
    todayRecovered = json['todayRecovered'] as int?;
    active = json['active'] as int?;
    critical = json['critical'] as int?;
    casesPerOneMillion = json['casesPerOneMillion'] as int?;
    deathsPerOneMillion = json['deathsPerOneMillion'] as int?;
    tests = json['tests'] as int?;
    testsPerOneMillion = json['testsPerOneMillion'] as int?;
    population = json['population'] as int?;
    continent = json['continent'] as String?;
    oneCasePerPeople = json['oneCasePerPeople'] as int?;
    oneDeathPerPeople = json['oneDeathPerPeople'] as int?;
    oneTestPerPeople = json['oneTestPerPeople'] as int?;
    activePerOneMillion = json['activePerOneMillion'] as num?;
    recoveredPerOneMillion = json['recoveredPerOneMillion'] as num?;
    criticalPerOneMillion = json['criticalPerOneMillion'] as num?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['updated'] = updated;
    json['country'] = country;
    json['countryInfo'] = countryInfo?.toJson();
    json['cases'] = cases;
    json['todayCases'] = todayCases;
    json['deaths'] = deaths;
    json['todayDeaths'] = todayDeaths;
    json['recovered'] = recovered;
    json['todayRecovered'] = todayRecovered;
    json['active'] = active;
    json['critical'] = critical;
    json['casesPerOneMillion'] = casesPerOneMillion;
    json['deathsPerOneMillion'] = deathsPerOneMillion;
    json['tests'] = tests;
    json['testsPerOneMillion'] = testsPerOneMillion;
    json['population'] = population;
    json['continent'] = continent;
    json['oneCasePerPeople'] = oneCasePerPeople;
    json['oneDeathPerPeople'] = oneDeathPerPeople;
    json['oneTestPerPeople'] = oneTestPerPeople;
    json['activePerOneMillion'] = activePerOneMillion;
    json['recoveredPerOneMillion'] = recoveredPerOneMillion;
    json['criticalPerOneMillion'] = criticalPerOneMillion;
    return json;
  }
}

class CountryInfo {
  int? id;
  String? iso2;
  String? iso3;
  num? lat;
  num? long;
  String? flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  CountryInfo.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as int?;
    iso2 = json['iso2'] as String?;
    iso3 = json['iso3'] as String?;
    lat = json['lat'] as num?;
    long = json['long'] as num?;
    flag = json['flag'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['iso2'] = iso2;
    json['iso3'] = iso3;
    json['lat'] = lat;
    json['long'] = long;
    json['flag'] = flag;
    return json;
  }
}
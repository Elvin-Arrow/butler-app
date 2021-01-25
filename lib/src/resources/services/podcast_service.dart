import 'http_request.dart';

class PodcastService {
  Future<PodcastSearchResult> getPodcastSearch(String query) async {
    final url = "https://api.podcastindex.org/api/1.0/search/byterm?q=$query&pretty";

    final podcastSearchResponse = await getData(url);

    PodcastSearchResult podcastSearchResult = PodcastSearchResult.fromJson(podcastSearchResponse);
    return podcastSearchResult;
  }
}

class PodcastSearchResult {
  String status;
  List<Feeds> feeds;
  int count;
  String query;
  String description;

  PodcastSearchResult(
      {this.status, this.feeds, this.count, this.query, this.description});

  PodcastSearchResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['feeds'] != null) {
      feeds = new List<Feeds>();
      json['feeds'].forEach((v) {
        feeds.add(new Feeds.fromJson(v));
      });
    }
    count = json['count'];
    query = json['query'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.feeds != null) {
      data['feeds'] = this.feeds.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['query'] = this.query;
    data['description'] = this.description;
    return data;
  }
}

class Feeds {
  int id;
  String title;
  String url;
  String originalUrl;
  String link;
  String description;
  String author;
  String ownerName;
  String image;
  String artwork;
  int lastUpdateTime;
  int lastCrawlTime;
  int lastParseTime;
  int lastGoodHttpStatusTime;
  int lastHttpStatus;
  String contentType;
  int itunesId;
  Null generator;
  String language;
  int type;
  int dead;
  int crawlErrors;
  int parseErrors;
  Categories categories;
  int locked;
  int imageUrlHash;

  Feeds(
      {this.id,
        this.title,
        this.url,
        this.originalUrl,
        this.link,
        this.description,
        this.author,
        this.ownerName,
        this.image,
        this.artwork,
        this.lastUpdateTime,
        this.lastCrawlTime,
        this.lastParseTime,
        this.lastGoodHttpStatusTime,
        this.lastHttpStatus,
        this.contentType,
        this.itunesId,
        this.generator,
        this.language,
        this.type,
        this.dead,
        this.crawlErrors,
        this.parseErrors,
        this.categories,
        this.locked,
        this.imageUrlHash});

  Feeds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    originalUrl = json['originalUrl'];
    link = json['link'];
    description = json['description'];
    author = json['author'];
    ownerName = json['ownerName'];
    image = json['image'];
    artwork = json['artwork'];
    lastUpdateTime = json['lastUpdateTime'];
    lastCrawlTime = json['lastCrawlTime'];
    lastParseTime = json['lastParseTime'];
    lastGoodHttpStatusTime = json['lastGoodHttpStatusTime'];
    lastHttpStatus = json['lastHttpStatus'];
    contentType = json['contentType'];
    itunesId = json['itunesId'];
    generator = json['generator'];
    language = json['language'];
    type = json['type'];
    dead = json['dead'];
    crawlErrors = json['crawlErrors'];
    parseErrors = json['parseErrors'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    locked = json['locked'];
    imageUrlHash = json['imageUrlHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['originalUrl'] = this.originalUrl;
    data['link'] = this.link;
    data['description'] = this.description;
    data['author'] = this.author;
    data['ownerName'] = this.ownerName;
    data['image'] = this.image;
    data['artwork'] = this.artwork;
    data['lastUpdateTime'] = this.lastUpdateTime;
    data['lastCrawlTime'] = this.lastCrawlTime;
    data['lastParseTime'] = this.lastParseTime;
    data['lastGoodHttpStatusTime'] = this.lastGoodHttpStatusTime;
    data['lastHttpStatus'] = this.lastHttpStatus;
    data['contentType'] = this.contentType;
    data['itunesId'] = this.itunesId;
    data['generator'] = this.generator;
    data['language'] = this.language;
    data['type'] = this.type;
    data['dead'] = this.dead;
    data['crawlErrors'] = this.crawlErrors;
    data['parseErrors'] = this.parseErrors;
    if (this.categories != null) {
      data['categories'] = this.categories.toJson();
    }
    data['locked'] = this.locked;
    data['imageUrlHash'] = this.imageUrlHash;
    return data;
  }
}

class Categories {
  String s104;
  String s105;
  String s107;

  Categories({this.s104, this.s105, this.s107});

  Categories.fromJson(Map<String, dynamic> json) {
    s104 = json['104'];
    s105 = json['105'];
    s107 = json['107'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['104'] = this.s104;
    data['105'] = this.s105;
    data['107'] = this.s107;
    return data;
  }
}


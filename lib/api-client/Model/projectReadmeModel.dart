class ProjectReadmeModel {
  ProjectReadmeModel({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.gitUrl,
    required this.downloadUrl,
    required this.type,
    required this.content,
    required this.encoding,
    required this.links,
  });

  final String? name;
  final String? path;
  final String? sha;
  final int? size;
  final String? url;
  final String? htmlUrl;
  final String? gitUrl;
  final String? downloadUrl;
  final String? type;
  final String? content;
  final String? encoding;
  final Links? links;

  ProjectReadmeModel copyWith({
    String? name,
    String? path,
    String? sha,
    int? size,
    String? url,
    String? htmlUrl,
    String? gitUrl,
    String? downloadUrl,
    String? type,
    String? content,
    String? encoding,
    Links? links,
  }) {
    return ProjectReadmeModel(
      name: name ?? this.name,
      path: path ?? this.path,
      sha: sha ?? this.sha,
      size: size ?? this.size,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      gitUrl: gitUrl ?? this.gitUrl,
      downloadUrl: downloadUrl ?? this.downloadUrl,
      type: type ?? this.type,
      content: content ?? this.content,
      encoding: encoding ?? this.encoding,
      links: links ?? this.links,
    );
  }

  factory ProjectReadmeModel.fromJson(Map<String, dynamic> json){
    return ProjectReadmeModel(
      name: json["name"],
      path: json["path"],
      sha: json["sha"],
      size: json["size"],
      url: json["url"],
      htmlUrl: json["html_url"],
      gitUrl: json["git_url"],
      downloadUrl: json["download_url"],
      type: json["type"],
      content: json["content"],
      encoding: json["encoding"],
      links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "path": path,
    "sha": sha,
    "size": size,
    "url": url,
    "html_url": htmlUrl,
    "git_url": gitUrl,
    "download_url": downloadUrl,
    "type": type,
    "content": content,
    "encoding": encoding,
    "_links": links?.toJson(),
  };

}

class Links {
  Links({
    required this.self,
    required this.git,
    required this.html,
  });

  final String? self;
  final String? git;
  final String? html;

  Links copyWith({
    String? self,
    String? git,
    String? html,
  }) {
    return Links(
      self: self ?? this.self,
      git: git ?? this.git,
      html: html ?? this.html,
    );
  }

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      self: json["self"],
      git: json["git"],
      html: json["html"],
    );
  }

  Map<String, dynamic> toJson() => {
    "self": self,
    "git": git,
    "html": html,
  };

}

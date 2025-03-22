class AllCategoriesResponseEntity {
  AllCategoriesResponseEntity({
    this.results,
    this.metadata,
    this.data,
    this.message

  });

  int? results;
  MetadataEntity? metadata;
  List<DataEntity>? data;
  String? message;
}

class DataEntity {
  DataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
}

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
	final int? albumId;
	final int? id;
	final String? title;
	final String? url;
	final String? thumbnailUrl;

	const Photo({
		this.albumId, 
		this.id, 
		this.title, 
		this.url, 
		this.thumbnailUrl, 
	});

	@override
	String toString() {
		return 'Photo(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
	}

	factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

	Map<String, dynamic> toJson() => _$PhotoToJson(this);

	Photo copyWith({
		int? albumId,
		int? id,
		String? title,
		String? url,
		String? thumbnailUrl,
	}) {
		return Photo(
			albumId: albumId ?? this.albumId,
			id: id ?? this.id,
			title: title ?? this.title,
			url: url ?? this.url,
			thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Photo) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			albumId.hashCode ^
			id.hashCode ^
			title.hashCode ^
			url.hashCode ^
			thumbnailUrl.hashCode;
}

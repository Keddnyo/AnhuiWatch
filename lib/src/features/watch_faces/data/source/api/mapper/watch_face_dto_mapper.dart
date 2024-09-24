import '../../firebase/entity/watch_face_entity.dart';
import '../dto/watch_face_dto.dart';

class WatchFaceDtoMapper {
  static WatchFaceDto toWatchFaceDto(
    Map<String, dynamic> json,
  ) =>
      WatchFaceDto(
        id: json['id'],
        idV2: json['id_v2'],
        appType: json['app_type'],
        displayName: json['display_name'],
        className: json['class_name'],
        icon: json['icon'],
        aodIcon: json['aod_icon'],
        versionName: json['version_name'],
        versionCode: json['version_code'],
        packageName: json['package_name'],
        packageNameHash: json['package_name_hash'],
        introduction: json['introduction'],
        publishName: json['publish_name'],
        configFile: json['config_file'],
        fileHash: json['file_hash'],
        fileSize: json['file_size'],
        downloadCount: json['download_count'],
        configFileV2: json['config_file_v2'],
        fileHashV2: json['file_hash_v2'],
        fileSizeV2: json['file_size_v2'],
      );

  static WatchFaceEntity toWatchFaceEntity(WatchFaceDto dto) => WatchFaceEntity(
        title: dto.displayName!,
        imageUrl: dto.icon!,
        fileUrl: dto.configFile!,
      );
}

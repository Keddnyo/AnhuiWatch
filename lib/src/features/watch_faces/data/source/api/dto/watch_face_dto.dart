class WatchFaceDto {
  final String? id;
  final String? idV2;
  final int? appType;
  final String? displayName;
  final String? className;
  final String? icon;
  final String? aodIcon;
  final String? versionName;
  final int? versionCode;
  final String? packageName;
  final String? packageNameHash;
  final String? introduction;
  final String? publishName;
  final String? configFile;
  final String? fileHash;
  final int? fileSize;
  final int? downloadCount;
  final String? configFileV2;
  final String? fileHashV2;
  final int? fileSizeV2;

  const WatchFaceDto({
    this.id,
    this.idV2,
    this.appType,
    this.displayName,
    this.className,
    this.icon,
    this.aodIcon,
    this.versionName,
    this.versionCode,
    this.packageName,
    this.packageNameHash,
    this.introduction,
    this.publishName,
    this.configFile,
    this.fileHash,
    this.fileSize,
    this.downloadCount,
    this.configFileV2,
    this.fileHashV2,
    this.fileSizeV2,
  });
}

class Car {
  final int carId;
  final String rcNumber;
  final int capacity;
  final String model;
  final String remark;
  final int isActive;
  final int createdBy;
  final List<Attachment> attachments;

  Car({
    required this.carId,
    required this.rcNumber,
    required this.capacity,
    required this.model,
    required this.remark,
    required this.isActive,
    required this.createdBy,
    required this.attachments,
  });
}

class Attachment {
  final String attachmentType;
  final List<String> attachmentUrls;

  Attachment({
    required this.attachmentType,
    required this.attachmentUrls,
  });
}

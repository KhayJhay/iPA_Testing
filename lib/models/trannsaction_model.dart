class TransactionModel {
  final String transactionType;
  final String transactionId;
  final String entityName;
  final String entityType;
  final String updatedAt;
  final String updatedBy;
  final String status;

  TransactionModel({
    required this.transactionType,
    required this.transactionId,
    required this.entityName,
    required this.entityType,
    required this.updatedAt,
    required this.updatedBy,
    required this.status,
  });
}

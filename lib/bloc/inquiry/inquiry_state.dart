import 'package:equatable/equatable.dart';

class InquiryState extends Equatable {
  final String? patientCondition;
  final String? affectedArea;
  final String? woundType;
  final String? additionalInfo;

  const InquiryState({
    this.patientCondition,
    this.affectedArea,
    this.additionalInfo,
    this.woundType
  });

  InquiryState copyWith({
    String? patientCondition,
    String? affectedArea,
    String? additionalInfo,
    String? woundType
  }) {
    return InquiryState(
      patientCondition: patientCondition ?? this.patientCondition,
      affectedArea: affectedArea ?? this.affectedArea,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      woundType: woundType ?? this.woundType
    );
  }

  @override
  List<Object?> get props =>
      [patientCondition, affectedArea, woundType, additionalInfo];
}
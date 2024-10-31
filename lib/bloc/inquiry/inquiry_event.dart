
import 'package:equatable/equatable.dart';

abstract class InquiryEvent extends Equatable{
  const InquiryEvent();
  @override
  List<Object?> get props => [];
}

class PatientConditionEvent extends InquiryEvent{
  final String patientCondition;
  const PatientConditionEvent(this.patientCondition);

}

class AffectedAreaEvent extends InquiryEvent{
  final String affectedArea;
  const AffectedAreaEvent(this.affectedArea);
}
class WoundTypeEvent extends InquiryEvent{
  final String woundType;
  const WoundTypeEvent(this.woundType);
}
class AdditionalInfoEvent extends InquiryEvent{
  final String additionalInfo;
  const AdditionalInfoEvent(this.additionalInfo);
}


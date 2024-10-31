
import 'package:flutter_bloc/flutter_bloc.dart';

import 'inquiry_event.dart';
import 'inquiry_state.dart';

class InquiryBloc extends Bloc<InquiryEvent,InquiryState>{
  InquiryBloc():super(const InquiryState()){
    on<InquiryEvent>((event, emit) async {
      if (event is PatientConditionEvent) {
        emit(state.copyWith(patientCondition : event.patientCondition));
      } else if (event is AffectedAreaEvent){
        emit(state.copyWith(affectedArea : event.affectedArea));
      } else if (event is WoundTypeEvent){
        emit(state.copyWith(woundType : event.woundType));
      } else if (event is AdditionalInfoEvent){
        emit(state.copyWith(additionalInfo : event.additionalInfo));
      }
    });
  }

}
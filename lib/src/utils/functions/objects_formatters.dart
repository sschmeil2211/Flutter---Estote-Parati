import 'package:estote_parati/src/models/models.dart';

String translateWorkArea(WorkArea workArea) {
  switch (workArea) {
    case WorkArea.groupValues:
      return 'Valores';
    case WorkArea.youthProgram:
      return 'Programa de jóvenes';
    case WorkArea.financialResources:
      return 'Recursos financieros';
    case WorkArea.management:
      return 'Gestión';
    case WorkArea.adultsOnMove:
      return 'Adultos en movimiento';
  }
}

String translateGroupPlanSection(String? section){
  switch (section) {
    case 'diagnosis':
      return 'Diagnóstico';
    case 'strategicObjective':
      return 'Objetivos Estratégicos';
    case 'actions':
      return 'Acciones';
    case 'concretionTime':
      return 'Tiempo de Concreción';
    case 'responsible':
      return 'Responsables';
    default:
      return '';
  }
}

String translateDurationType(DurationType durationType){
  switch(durationType){
    case DurationType.short:
      return 'Corta';
    case DurationType.long:
      return 'Larga';
  }
}

String translateEventType(EventType eventType){
  switch(eventType){
    case EventType.planning:
      return 'Planificación';
    case EventType.groupEvent:
      return 'Evento';
    case EventType.groupActivity:
      return 'Actividad';
    case EventType.course:
      return 'Curso';
    case EventType.collection:
      return 'Recoleccion';
    case EventType.branchActivity:
      return 'Actividad de Rama';
    case EventType.advice:
      return 'Consejo';
  }
}

TargetBranch parseTargetBranch(String? branch) {
  switch (branch) {
    case 'manada':
      return TargetBranch.manada;
    case 'unidad':
      return TargetBranch.unidad;
    case 'caminantes':
      return TargetBranch.caminantes;
    case 'rover':
      return TargetBranch.rover;
    case 'group':
      return TargetBranch.group; // Valor por defecto
    default:
      return TargetBranch.group;
  }
}

ActivityType parseActivityType(String type) {
  switch (type) {
    case 'integration':
      return ActivityType.integration;
    default:
      return ActivityType.integration; // Valor por defecto
  }
}

DurationType parseDurationType(String type) {
  switch (type) {
    case 'short':
      return DurationType.short;
    case 'long':
      return DurationType.long;
    default:
      return DurationType.short; // Valor por defecto
  }
}

EventType parseEventType(String type){
  switch(type){
    case 'advice':
      return EventType.advice;
    case 'branchActivity':
      return EventType.branchActivity;
    case 'collection':
      return EventType.collection;
    case 'course':
      return EventType.course;
    case 'groupActivity':
      return EventType.groupActivity;
    case 'groupEvent':
      return EventType.groupEvent;
    case 'planning':
      return EventType.planning;
    default:
      return EventType.groupEvent;
  }
}
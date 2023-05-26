/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Tarefa type in your schema. */
@immutable
class Tarefa extends Model {
  static const classType = const _TarefaModelType();
  final String id;
  final String? _titulo;
  final String? _infor;
  final bool? _IsComplete;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TarefaModelIdentifier get modelIdentifier {
      return TarefaModelIdentifier(
        id: id
      );
  }
  
  String get titulo {
    try {
      return _titulo!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get infor {
    try {
      return _infor!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get IsComplete {
    try {
      return _IsComplete!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Tarefa._internal({required this.id, required titulo, required infor, required IsComplete, createdAt, updatedAt}): _titulo = titulo, _infor = infor, _IsComplete = IsComplete, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Tarefa({String? id, required String titulo, required String infor, required bool IsComplete}) {
    return Tarefa._internal(
      id: id == null ? UUID.getUUID() : id,
      titulo: titulo,
      infor: infor,
      IsComplete: IsComplete);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tarefa &&
      id == other.id &&
      _titulo == other._titulo &&
      _infor == other._infor &&
      _IsComplete == other._IsComplete;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tarefa {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("titulo=" + "$_titulo" + ", ");
    buffer.write("infor=" + "$_infor" + ", ");
    buffer.write("IsComplete=" + (_IsComplete != null ? _IsComplete!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tarefa copyWith({String? titulo, String? infor, bool? IsComplete}) {
    return Tarefa._internal(
      id: id,
      titulo: titulo ?? this.titulo,
      infor: infor ?? this.infor,
      IsComplete: IsComplete ?? this.IsComplete);
  }
  
  Tarefa.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _titulo = json['titulo'],
      _infor = json['infor'],
      _IsComplete = json['IsComplete'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'titulo': _titulo, 'infor': _infor, 'IsComplete': _IsComplete, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'titulo': _titulo, 'infor': _infor, 'IsComplete': _IsComplete, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<TarefaModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<TarefaModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TITULO = QueryField(fieldName: "titulo");
  static final QueryField INFOR = QueryField(fieldName: "infor");
  static final QueryField ISCOMPLETE = QueryField(fieldName: "IsComplete");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tarefa";
    modelSchemaDefinition.pluralName = "Tarefas";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tarefa.TITULO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tarefa.INFOR,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Tarefa.ISCOMPLETE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TarefaModelType extends ModelType<Tarefa> {
  const _TarefaModelType();
  
  @override
  Tarefa fromJson(Map<String, dynamic> jsonData) {
    return Tarefa.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Tarefa';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Tarefa] in your schema.
 */
@immutable
class TarefaModelIdentifier implements ModelIdentifier<Tarefa> {
  final String id;

  /** Create an instance of TarefaModelIdentifier using [id] the primary key. */
  const TarefaModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TarefaModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TarefaModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}
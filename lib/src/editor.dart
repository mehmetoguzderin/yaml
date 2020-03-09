import 'dart:collection';

import 'loader.dart';
import 'null_span.dart';
import 'yaml_document.dart';
import 'yaml_node.dart';

/// An editor that edits YAML strings
class Editor {
  final String _sourceYaml;
  final YamlDocument _sourceDocument;

  Editor(this._sourceYaml)
      : _sourceDocument = Loader(_sourceYaml).load() ??
            YamlDocument.internal(
              YamlScalar.internalWithSpan(null, NullSpan(null)),
              NullSpan(null),
              null,
              const [],
            );

  String edit(dynamic edits) {
    var output = '';
    var stack = [edits];
    while (stack.isNotEmpty) {
      var cursor = stack.removeLast();
      if (cursor is Map) {
        if (_sourceDocument.contents is YamlMap) {
        } else {
          return _sourceYaml;
        }
      } else if (cursor is List) {
        if (_sourceDocument.contents is YamlList) {
        } else {
          return _sourceYaml;
        }
      } else {
        if (_sourceDocument.contents is YamlScalar) {
        } else {
          return _sourceYaml;
        }
      }
    }
    return output;
  }
}

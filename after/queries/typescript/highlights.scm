; extends
(parenthesized_expression ["(" ")"] @punctuation.paren)
(statement_block ["{" "}"] @punctuation.brace)
(class_body ["{" "}"] @punctuation.brace)

(arguments ["(" ")"] @punctuation.bracket.args)
(formal_parameters ["(" ")"] @punctuation.bracket.args)
(named_imports ["{" "}"] @punctuation.bracket.import)
(export_clause ["{" "}"] @punctuation.bracket.export)
(array ["[" "]"] @punctuation.bracket.array)
(object ["{" "}"] @punctuation.bracket.object)
(object_pattern ["{" "}"] @punctuation.bracket.object_type)
(object_type ["{" "}"] @punctuation.bracket.object_type)

(lexical_declaration ["const" "let" "var"] @keyword.var_declare)
(public_field_definition ["static"] @keyword.static)
(arrow_function ["=>"] @keyword.arrow)

(for_in_statement ["const" "let" "var"] @keyword.var_declare)

(function_declaration ["function"] @keyword.function)

(this) @keyword.this
(type_identifier) @type

(type_predicate) @keyword.is
(as_expression) @keyword.as

(predefined_type) @type.predefined

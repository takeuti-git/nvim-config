; extends
(parenthesized_expression ["(" ")"] @punctuation.paren)
(statement_block ["{" "}"] @punctuation.brace)
(class_body ["{" "}"] @punctuation.brace)

(arguments ["(" ")"] @punctuation.bracket.args)
(formal_parameters ["(" ")"] @punctuation.bracket.args)
(named_imports ["{" "}"] @punctuation.bracket.import)
(array ["[" "]"] @punctuation.bracket.array)
(object ["{" "}"] @punctuation.bracket.object)

(lexical_declaration ["const" "let"] @keyword.var_declare)
(public_field_definition ["static"] @keyword.static)
(arrow_function ["=>"] @keyword.arrow)


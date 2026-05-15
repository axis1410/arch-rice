; extends

((call
  function: (attribute
    attribute: (identifier) @_method)
  arguments: (argument_list
    .
    [
      (string
        (string_content) @injection.content)
      (concatenated_string
        (string
          (string_content) @injection.content))
    ]))
 (#eq? @_method "sql")
 (#set! injection.language "sql")
 (#set! injection.combined))

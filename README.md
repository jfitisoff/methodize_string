# methodize_string
A small library that transforms UI strings into strings that can be used as method names.

It adds two methods to the String class:

String#methodize

String.methodize!

Basic examples:
```ruby
require 'methodize_string'

'Save Changes'.methodize
=> "save_changes"

'Continue Reading...'.methodize
=> "continue_reading"
```

Accented character handling:
```ruby
# By default, accented characters will be converted.
"Ä Ö Ü".methodize
=> "a_o_u"

# But if you want the accented chars you can do this.
"Ä Ö Ü".methodize(transliterate: false)
=> "ä_ö_ü"
```

Error handling:
```ruby
# Non-bang method will return nil if the string can't be converted.
''.methodize
=> nil

# Bang method raises an ArgumentError if the string can't be converted.
''.methodize!
ArgumentError: Unable to convert string to a method string: ''
```

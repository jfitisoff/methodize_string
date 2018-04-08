# methodize_string
A small library that transforms UI strings into strings that can be used as method names.

It adds two methods to the String class:

String#methodize

String.methodize!

##Basic usage:
```ruby
require 'methodize_string'

'Save Changes'.methodize
=> "save_changes"

'Continue Reading...'.methodize
=> "continue_reading"
```

##Accented character handling:
```ruby
# By default, accented characters will be converted to non-accented characters.
"Ä Ö Ü".methodize
=> "a_o_u"

# But this behavior can be overridden.
"Ä Ö Ü".methodize(transliterate: false)
=> "ä_ö_ü"
```

##Error handling:
```ruby
# The non-bang method won't raise an error. It will just return nil if the string
# can't be converted.
''.methodize
=> nil

# The bang method raises an ArgumentError in cases where the string can't be converted.
''.methodize!
ArgumentError: Unable to convert string to a method string: ''
```

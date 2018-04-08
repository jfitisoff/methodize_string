require_relative 'number_map'

class MethodizeString
  def self.methodize(str, kwargs = {})
    return nil if str.blank?

    args = {
      transliterate: true
    }.merge(kwargs)

    # Chop off a reasonable part of the string to methodize.
    tmp = str.squish.split(/(\n|\(|\[|\.\s*\S+|\/)$/)[0].strip

    # TODO: first, second, third...
    if tmp =~ /^[[:space:]+, \s+]*\d+\S+/
      return nil
    else
      if match = tmp.match(/^[[:space:]+, \s+]*(\d+)(?=[[:space:]+, \s+]+|$)/)
      # if match = tmp.match(/^[[:space:]+, \s+]*(\d+|\d+st|\d+nd|\d+rd|\dth)[[:space:]+, \s+]+/)
        if word = NUMBER_MAP[$1.to_i]
          tmp = tmp.sub(/^[[:space:]+, \s+]*\d+/, word)
        else
          nil
        end
      end
    end

    # Other special cases.
    tmp = tmp.gsub(/(\s+&{1,2}\s+)/, '_and_')
    tmp = tmp.gsub(/(\s+\|\|\s+)/, '_or_')
    tmp = tmp.gsub(/(\s+%\s+)/, '_percent_')
    tmp = tmp.gsub(/(\s+\+\s+)/, '_plus_')

    # Remove non-ASCII chars and convert to method format.
    tmp = tmp.chars.map do |c|
      c if c =~ /^[\p{L}\p{M}\p{Nd}\s]+$/
    end.compact.join.mb_chars.downcase.gsub(/[[:space:],\s]+/, '_').squish.to_s

    if tmp.present?
      if args[:transliterate]
        tmp = I18n.transliterate(tmp)
        if tmp =~ /\?/
          nil
        else
          tmp
        end
      else
        tmp
      end
    else
      nil
    end
  end

  def self.methodize!(str, kwargs = {})
    unless tmp = MethodizeString.methodize(str, **kwargs)
      raise ArgumentError, "Unable to convert string to a method string: '#{str}'"
    end

    tmp
  end
end

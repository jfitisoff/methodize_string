class String
  def methodize(kwargs = {})
    MethodizeString.methodize(self, **kwargs)
  end

  def methodize!(kwargs = {})
    MethodizeString.methodize!(self, **kwargs)
  end
end

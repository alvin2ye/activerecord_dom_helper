module ActiverecordDomHelper
  def dom_id(prefix = nil)
    "#{prefix}-#{self.class.name.underscore}_#{self.new_record? ? "new" : id}".gsub('_', '-').gsub(/^-/, '')
  end

  def dom_class(prefix = nil)
    "#{prefix}-#{self.class.name.underscore}".gsub('_', '-').gsub(/^-/, '')
  end
end

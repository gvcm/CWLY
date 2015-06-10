class Document < ActiveRecord::Base

  after_create :slug_g

  # def self.search(field, value)
  #   self.where("data->>'#{field}' = ?", value)
  # end

  # Document.search({ projectName: 'm2sjZ' })
  def self.search(args)
    Document.where("data @> ?", args.to_json)
  end

  # Document.where("data->'tags' ? :tag", tag: 'x')

  def destination
    return if self.url.blank?
    uri = URI.parse(self.url)
    uri.fragment = self.slug
    uri.to_s
  end

  def origin
    return if self.url.blank?
    uri = URI.parse(self.url)
    origin = URI('')
    origin.scheme = uri.scheme
    origin.host = uri.host
    origin.port = uri.port
    origin.to_s
  end

  protected

  def slug_g
    self.update_attributes(slug: self.id.to_s(36))
  end

end

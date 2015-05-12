class Document < ActiveRecord::Base

  after_create :slug_g

  # def data=(data)
  #   self[:data] = data.is_a?(String) ? data.to_json : data
  # end

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

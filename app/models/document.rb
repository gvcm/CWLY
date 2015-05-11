class Document < ActiveRecord::Base

  after_create :slug_g

  def url_frag
    return if self.url.blank?
    uri = URI.parse(self.url)
    uri.fragment = self.slug
    uri.to_s
  end

  protected

  def slug_g
    self.update_attributes(slug: self.id.to_s(36))
  end

end

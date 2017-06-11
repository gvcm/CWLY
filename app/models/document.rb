class Document < ActiveRecord::Base

  after_create :slug_g

  def self.containing(args)
    where("data @> ?", args.to_json)
  end

  def self.containing_text(args)
    path, text = flat_hash(args).flatten
    query = <<-EOS
      #{primary_key} IN (
        SELECT #{primary_key}
        FROM #{table_name}, jsonb_extract_path_text(
          #{table_name}.data, #{path.length.times.map { "?" }.join(", ")}) AS txt
        WHERE txt ILIKE ?
      )
    EOS
    where(query, *path, "%#{text}%")
  end
  
  def self.containing_values(args)
    path, values = flat_hash(args).flatten
    query = <<-EOS
      #{primary_key} IN (
        SELECT #{primary_key}
        FROM #{table_name}, jsonb_each_text(#{table_name}.data#>?) AS obj
        WHERE UPPER(obj.value) IN (?)
      )
    EOS
    where(query, "{#{path.join(',')}}", values.map { |v| v.upcase })
  end

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

  def file(ext)
    content = data.fetch('files') { {} }[ext]
    Base64.decode64(content) unless content.nil?
  end

  protected

  def self.flat_hash(h,f=[],g={})
    return g.update({ f=>h }) unless h.is_a? Hash
    h.each { |k,r| flat_hash(r,f+[k],g) }
    g
  end

  def slug_g
    self.update_attributes(slug: self.id.to_s(36))
  end

end

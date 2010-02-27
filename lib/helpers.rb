def base_url
  url = "http://#{request.host}"
  request.port == 80 ? url : url + ":#{request.port}"
end

def url(page)
  File.join(base_url, page.path)
end

def link_to(text, link='#', options = {})
  tag = "<a href='#{link}'"
  tag += " class=\"#{options[:class]}\"" if options[:class]
  tag += " id=\"#{options[:id]}\"" if options[:id]
  tag += " title=\"#{options[:title]}\"" if options[:title]
  tag += ">#{text}</a>"
end

def rfc_3339(timestamp)
  timestamp.strftime("%Y-%m-%dT%H:%M:%SZ")
end

def partial(name)
  haml(:"_#{name}", :layout => false)
end

def image_tag(file, options={})
  tag = "<img src='/images/#{file}'"
  tag += " alt='#{options[:alt]}' title='#{options[:alt]}' " if options[:alt]
  tag += "/>"
end

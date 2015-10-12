# Check https://github.com/nesquena/sinatra_more for other possibilities
# These helper methods are for reference and still need cleanup,
# but prefer to do so when I actually need them

def link_to(name, url, options = {})
  content_tag(:a, name, url, options)
end

def image_tag(url, options={})
  options.reverse_merge!(src: image_path(url))
  tag(:img, options)
end

def rfc_3339(timestamp)
  timestamp.strftime("%Y-%m-%dT%H:%M:%SZ")
end

def partial(name, options = {})
  haml :"_#{name}", options.merge!(layout: false)
end

def content_tag(name, *args)
  options = args.extract_options!
  content = options.delete(:content)
  tag(name, options.merge(content: content))
end

def current_year
  Time.current.strftime("%Y")
end

private

def image_path(src)
  src.gsub!(/\s/, "")
  src =~ %r{^\s*(/|http)} ? src : File.join("public/images", src)
end

def tag(name, options={})
  content = options.delete(:content)
  html_attrs = options.collect { |a, v| "#{a}='#{v}'" }.compact.join(" ")

  if content
    base_tag = "<#{name} #{html_attrs}>"
    base_tag << content
    base_tag << "</#{name}>"
  else
    base_tag = "<#{name} #{html_attrs} />"
  end

  base_tag
end

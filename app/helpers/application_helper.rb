# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

=begin
  def breadcrumbs(sep = "/", include_home = true)
     levels = request.path.split('?')[0].split('/')
     levels.delete_at(0)

     #links = "You are here: "
     links  = content_tag('li', (content_tag('a', t(:home_page), :href => root_path ) if include_home))
     
     nocrumb = ["collections", "albums", "photos", "tags", "new", "edit", "tags"]

     levels.each_with_index do |level, index|
       level = level.gsub(/^[0-9]+\-/,"") #if levels[index-1] == "photos"
       level = level.gsub("-", " ")
       if index+1 == levels.length
         #links += " #{sep} #{level.upcase}" unless nocrumb.include?(level)
       #elsif !nocrumb.include?(level)
         links += " " + sep + " "
         links += content_tag('li', content_tag('a', level, :href => '/'+levels[0..index].join('/')))
       end
     end

     content_tag("ul", links, :class => "breadcrumb")
  end
=end

  def pluralize(string, count=nil, variants=nil)
    # example variants for russian: #   Russian.pluralize(3.14, "вещь", "вещи", "вещей", "вещи")
    a,b,c,d=*variants
    I18n.locale.eql?(:ru) ? Russian.pluralize(count, a,b,c,d) : string.pluralize
  end
end

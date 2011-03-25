module ApplicationHelper

def title
	base_title = "ZPionka"
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
end

 def breadcrumb(url, options = {})
    options.reverse_merge!( :separator => '>',
                            :home_link => 'Home')

    path_segments = url.sub(/\?.*/,'').split('/')[1..-1]
    return '' if path_segments.blank? # ie: suppress breadcrumbs on homepage
    path_array = path_segments.inject([]){|m,x| m.push(m.empty? ? x : "#{m[-1]}/#{x}")}

    middle_links = path_array[0..-2].map do |path|
      link_to path_name_for(path), "/#{path}"
    end

    returning [middle_links, path_name_for(path_array[-1])] do |links|
      links.unshift link_to(options[:home_link], root_path) if options[:home_link]
    end.flatten.join(options[:separator])

  end

  def path_name_for path = ''
    route = ActionController::Routing::Routes.recognize_path('/' + path, {:method => :get})
    controller_name = route[:controller].split('/')[-1]
    case route[:action]
    when 'show' then controller_name.singularize.camelize.constantize.find(route[:id]).name
    when 'index' then controller_name.titleize
    else route[:action].titleize
    end
  rescue
    (route ? "#{route[:controller]} #{route[:action]}" : path).titleize
  end



end

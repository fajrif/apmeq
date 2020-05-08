module ApplicationHelper
  def blank_or_not(object,blank='-')
    if object.blank?
      blank
    else
      if block_given?
        yield
      else
        object
      end
    end
  end

	def sortable(column, title = nil)
    title ||= column
    direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_tag = link_to title.titleize, params.merge(:sort => column, :direction => direction, :page => nil)
    icon_tag = column == params[:sort] ? "&nbsp;<i class='#{direction == "asc" ? "icon-arrow-up" : "icon-arrow-down"}'></i>" : ""
    link_tag + icon_tag.html_safe
  end

	def empty_data_message(model, new_link)
		raw("Currently there are no data #{model.model_name.human.pluralize.downcase} at the moment. Please create one by clicking #{link_to "here", new_link}.")
	end

	def title(page_title, small_title = nil)
    content_for(:title) { h(page_title.to_s) }
    content_for(:page_title) do
			content_tag(:h2, :class => "section-title") do
				title = page_title.to_s + " "
				title += content_tag(:small) do
					small_title.to_s
				end if small_title
				title.html_safe
			end
		end
  end

	def flash_message
    message = ""
    flash.each do |name, msg|
			message += content_tag :div, :class => "text-center alert alert-#{name.to_sym == :notice ? "success" : "danger"}" do
				content_tag(:span, msg) + button_tag("X", :type => "button", :class => "close", "data-dismiss" => "alert")
			end unless msg == true
    end
    message.html_safe
  end

	def current_path?(*path)
		re = Regexp.union(path)
		return 'current' if request.path.match(re)
		''
  end

	def offset_helper(size, max_size=6)
		cnt = max_size - size
		if cnt > 0
			return "col-md-offset-#{cnt}"
		end
  end

	def truncate_title(title, length=30)
		truncate(title, length: length, omission: "...")
  end

	def truncate_paragraph(desc, length=0)
		if length > 0
			truncate(Nokogiri::HTML.parse(desc).css('p')[0].text, length: length, omission: "...")
		else
			Nokogiri::HTML.parse(desc).css('p')[0].text
		end
  end

  def is_home_page?
    controller.controller_name == "home" && controller.action_name == "index"
  end

  def is_info_page?
    controller.controller_name == "home" && ( controller.action_name == "general" || controller.action_name == "event" )
  end

  def is_contact_page?
    controller.controller_name == "contacts"
  end

  def is_dashboard_page?
		controller.controller_name == "dashboard"
  end

  def is_manage_data_page?
		controller.controller_name == "banners" ||
		controller.controller_name == "articles" ||
		controller.controller_name == "links" ||
		controller.controller_name == "categories"
  end

  def is_data_event_page?
		controller.controller_name == "horses" ||
		controller.controller_name == "galleries" ||
		controller.controller_name == "instructors" ||
		controller.controller_name == "services" ||
		controller.controller_name == "facilities"
  end

  def is_data_contact_page?
		controller.controller_name == "contacts" ||
		controller.controller_name == "bookings"
  end

end

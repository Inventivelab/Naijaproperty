module ApplicationHelper

  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
    end
  end

  def timeago(time, options ={})
		options[:class] ||= "timeago"
		content_tag(
			:time,
			time.to_s,
			options.merge(datetime: time.getutc.iso8601)
		) if time
	end

  def title(listing_title)
  content_for(:title) { listing_title }
  end

  def meta_description(listing_summary)
    content_for(:meta_description) { listing_summary }
  end
end

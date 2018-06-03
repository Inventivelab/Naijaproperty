module ApplicationHelper

  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large"
    elsif
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "https://www.gravatar.com/avatar/#{gravatar_id}"
    else
      "https://s3.amazonaws.com/naijaproperty/np/listings-blank.jpg"
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

  def listing_title(listing_title)
  content_for(:title) { listing_title }
  end

  def meta_description(listing_summary)
    content_for(:meta_description) { listing_summary }
  end

  def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap-4' )

    super( objects, options )
  end

  def price_to_currency(price)
    number_to_currency(price, :unit => "₦", :separator => ".", :delimiter => ",")
  end
  def rent_to_currency(rent_price)
    number_currency(rent_price, :unit => "₦", :separator => ".", :delimiter => ",")
  end
  def short_stay_to_currency(short_stay_price)
    number_to_currency(short_stay_price, :unit => "₦", :separator => ".", :delimiter => ",")
  end
end

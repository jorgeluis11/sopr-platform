module UsersHelper
  def gravatar_for(user, options = { size: 140 })
    size = options[:size]
    "http://gravatar.com/avatar/#{user.gravatar_user_hash}.png?s=#{size}"
  end

  def facebook_url(user)
    "https://facebook.com/#{user.facebook_username}"
  end

  def twitter_url(user)
    "https://twitter.com/#{user.twitter_username}"
  end

  def linkedin_url(user)
    "http://www.linkedin.com/in/#{user.linkedin_username}"
  end

  def github_url(user)
    "https://github.com/#{user.github_username}"
  end

  def flickr_url(user)
    "http://www.flickr.com/people/#{user.flickr_username}/"
  end

  def dribbble_url(user)
    "http://dribbble.com/#{user.dribbble_username}"
  end

  def social_icon_links(user)
    content_tag :ul do
      %w(facebook twitter linkedin github flickr dribbble website).each do |social|
        concat(content_tag(:li, send("#{social}_icon_link", user))) if (social.eql?('website') ? user.send("#{social}_url?") : user.send("#{social}_username?"))
      end
    end
  end

  def facebook_icon_link(user)
    link_to facebook_url(user) do
      content_tag(:em, '', class: 'icon-facebook-1')
    end
  end

  def twitter_icon_link(user)
    link_to twitter_url(user) do
      content_tag(:em, '', class: 'icon-twitter-1')
    end
  end

  def linkedin_icon_link(user)
    link_to linkedin_url(user) do
      content_tag(:em, '', class: 'icon-linkedin-2')
    end
  end

  def github_icon_link(user)
    link_to github_url(user) do
      content_tag(:em, '', class: 'icon-github')
    end
  end

  def flickr_icon_link(user)
    link_to flickr_url(user) do
      content_tag(:em, '', class: 'icon-flickr')
    end
  end

  def dribbble_icon_link(user)
    link_to dribbble_url(user) do
      content_tag(:em, '', class: 'icon-dribbble-1')
    end
  end

  def website_icon_link(user)
    link_to user.website_url do
      content_tag(:em, '', class: 'icon-globe-2')
    end
  end
end

module AvatarHelper
  def avatar_for(user, classes: nil)
    encoded_name = ERB::Util.url_encode(user.full_name)
    src = "https://ui-avatars.com/api/?name=#{encoded_name}&format=svg&background=DBEAFE"

    content_tag(:img, '', src: src, alt: user.full_name, class: classes)
  end
end

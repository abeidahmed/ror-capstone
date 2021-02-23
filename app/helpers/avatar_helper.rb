module AvatarHelper
  def avatar_for(name)
    encoded_name = ERB::Util.url_encode(name)
    "https://ui-avatars.com/api/?name=#{encoded_name}&format=svg&background=DBEAFE"
  end
end

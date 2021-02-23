module UsersHelper
  def render_follow_button_for(user)
    return if current_user == user

    if current_user.following?(user)
      form_with url: app_following_path(user), method: :delete, class: 'relative', data: { remote: true } do |form|
        form.submit 'Unfollow',
                    class: 'px-4 flex-shirnk-0 py-1 text-sm font-medium leading-6 bg-red-50 text-red-500 border
        border-red-500 rounded-full focus:outline-none hover:bg-red-100 transition duration-150 ease-in-out'
      end
    else
      form_with url: app_user_followings_path(user), class: 'relative', data: { remote: true } do |form|
        form.submit 'Follow',
                    class: 'px-4 flex-shirnk-0 py-1 text-sm font-medium leading-6 bg-blue-50 text-blue-500 border
        border-blue-500 rounded-full focus:outline-none hover:bg-blue-100 transition duration-150 ease-in-out'
      end
    end
  end
end

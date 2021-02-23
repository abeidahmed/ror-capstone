module TweetsHelper
  def render_like_button(tweet)
    if current_user.voted_up_on?(tweet)
      heroicon 'heart', variant: :solid, class: 'text-red-500'
    else
      heroicon 'heart', size: 20
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :mobile?
  $visit_count = Home.find(1)
  abc = $visit_count.count_view += 1
  $visit_count.update_attribute "count_view", abc
  
  $really_visit_count_total = Impression.all.count
  
  $all_notices = AllNotice.order("created_at DESC").all
  
  private
  def mobile? # has to be in here because it has access to "request"
    request.user_agent =~ /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
  end
end

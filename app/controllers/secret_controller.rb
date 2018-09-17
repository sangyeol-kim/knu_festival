class SecretController < ApplicationController
  def index
    @really_visit_count_total = Impression.all.count
    @all_notices = AllNotice.order("created_at DESC").all
  end
end

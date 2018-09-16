class SecretController < ApplicationController
  def index
    @really_visit_count_total = Impression.all.count
  end
end

class HomesController < ApplicationController
    impressionist actions: [:index], unique: [:ip_address]
    
    def index
        # 방문자수 체크
        # 반드시 rake db:seed 할 것.
        @visit_count = Home.find(1)
        abc = @visit_count.count_view += 1
        @visit_count.update_attribute "count_view", abc
        
        @really_visit_count_total = Impression.all.count
        
        @all_notices = AllNotice.order("created_at DESC").all
    end
end

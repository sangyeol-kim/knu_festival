class HomesController < ApplicationController
    impressionist actions: [:index], unique: [:session_hash]
 
    #def log_impression
        #@visit_count = Home.find(1)
        ## this assumes you have a current_user method in your authentication system
        #@visit_count.impressions.create(ip_address: request.remote_ip)
        #@visit_count_total = Impression.all.count
    #end
   
    def index
            @visit_count_total = Impression.all.count
            @visit_count_total_result = @visit_count_total + 404
    #    # 방문자수 체크
    #    # 반드시 rake db:seed 할 것.
    #    @visit_count = Home.find(1)
    #    abc = @visit_count.count_view += 1
    #    @visit_count.update_attribute "count_view", abc
    end
end

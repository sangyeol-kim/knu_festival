class HomesController < ApplicationController
    before_action :log_impression, :only=> [:index], :validates_uniqueness_of => [:ip_address]
 
    def log_impression
        @visit_count = Home.find(1)
        # this assumes you have a current_user method in your authentication system
        @visit_count.impressions.create(ip_address: request.remote_ip)
        @visit_count_total = Impression.all.count
    end
   
    #def index
    #    # 방문자수 체크
    #    # 반드시 rake db:seed 할 것.
    #    @visit_count = Home.find(1)
    #    abc = @visit_count.count_view += 1
    #    @visit_count.update_attribute "count_view", abc
    #end
end

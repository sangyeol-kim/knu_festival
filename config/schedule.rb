#/config/schedule.rb
require "tzinfo"
 
def local(time)
        TZInfo::Timezone.get('Asia/Seoul').local_to_utc(Time.parse(time))
end
 
# 매 20분마다 코레일 API 시간 최신화
every :day, at: local('5:00 am') do
    rake "crawlling_weather:crawlling_weather"
end
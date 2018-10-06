require 'rubygems'
require 'rest_client'
require 'cgi'

namespace :crawlling_weather do
  desc "TODO"
  task crawlling_weather: :environment do
    # 과거에 쓰여진 DB를 전부 제거
    WeatherRainy.all.each do |x|
        x.destroy
    end
    
    WeatherDegree.all.each do |x|
        x.destroy
    end
    
    # API DB 최신화
    url = 'http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=BbZ0drUpIeC1gvrWFtaIJSyPQxEI7Ldf%2FIL5DMtxwjZa%2BfAEE0%2BWzzzMStb3V%2FoLL%2F6MnTCxEDRFWpX9KHDHIg%3D%3D'
    headers = { :params => { CGI::escape('numOfRows') => '50', CGI::escape('base_date') => "#{(Time.now+9.hours).strftime('%Y%m%d')}", CGI::escape('base_time') => "#{(Time.now+8.hours).strftime('%H')}00", CGI::escape('nx') => '73', CGI::escape('ny') => '133' } }
    @weather = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
    @weather_to_xml = @weather.body
    @doc = Nokogiri::XML(@weather_to_xml)
    # category Mapping
    @weather_category = @doc.xpath("//category") # 기온, 흐림 수치 등등
    @weather_fcstValue = @doc.xpath("//fcstValue") # category 수치
    @weather_fcstTime = @doc.xpath("//fcstTime") # 예측 시간
    @weather_fcstDate = @doc.xpath("//fcstDate") # 예측 날짜
    
    @weather_to_hash = @weather_category.zip(@weather_fcstValue, @weather_fcstTime, @weather_fcstDate) # category, cstValue, fcstTime 변수를 하나의 배열로 합침
    
    # DB에 데이터가 쓰이는 코드
    for num in 0..50
      if ((@weather_to_hash[num][0].text == "T3H"))
        @weather_result = WeatherDegree.new
        @weather_result.status = "3시간 기온"
        @weather_result.degree = @weather_to_hash[num][1].text
        @weather_result.time = @weather_to_hash[num][2].text
        @weather_result.date = @weather_to_hash[num][3].text
        @weather_result.save
      elsif (@weather_to_hash[num][0].text == "POP")
        @weather_result = WeatherRainy.new
        @weather_result.status = "강수확률"
        @weather_result.rainy = @weather_to_hash[num][1].text
        @weather_result.time = @weather_to_hash[num][2].text
        @weather_result.date = @weather_to_hash[num][3].text
        @weather_result.save
      end
    end
    
  end
end
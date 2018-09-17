class KakaoController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    #플친 키보드
    def keyboard
        
        @keyboard = {
            type: "buttons",
            buttons: ["머동 사이트로 이동","축제 일정 보기","축제 라인업 보기","술친 구하기"]
        }
        
        render json: @keyboard
    end
    
    #플친 메시지
    def message
        
        @input = params[:content]
        
        if @input == "머동 사이트로 이동"
            @msg = {
            message: {
                text: "머동제 사이트로 이동",
                photo: {
                  url: "https://postfiles.pstatic.net/MjAxODA5MTFfMjM3/MDAxNTM2NjYxOTQ4Njc4.q2mz6tNAcSvSfd8mZkG2ze7HfX1qs75lK5BbLFkO0iog.arV7nzgGjBcy75JzDYz0iTKpAuKWotnnZ0qvyzqFwPQg.JPEG.hsj0531/%EB%A8%B8%EB%8F%99.jpg?type=w580",
                  width: 640,
                  height: 800
                },
                message_button: {
                  label: "머동 사이트로 이동",
                  url: "https://13.125.176.150"
                }
              },
              keyboard: {
                type: "buttons",
                buttons: ["머동 사이트로 이동","축제 일정 보기","축제 라인업 보기","술친 구하기"]
              }
            }
        elsif @input == "축제 일정 보기"
            @msg = {
                message: {
                    text: "일차를 골라주세요~"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차", "2일차", "3일차"]
              }
            }
        elsif @input == "축제 라인업 보기"
            @msg = {
                message: {
                text: "축제 라인업",
                photo: {
                  url: "https://postfiles.pstatic.net/MjAxODA5MTRfNCAg/MDAxNTM2OTMyNTg1MDMx.knw2A8k6Q2l4ldsb2fmH_rNocV477FBnLiu_i4OcrwEg.GmIf0RGI3QyC4RZiry01xyM6Kv4FW2QqsMwh4pcGS-Yg.PNG.hsj0531/asdf.png?type=w580",
                  width: 800,
                  height: 1500
                }},
                keyboard: {
                type: "buttons",
                buttons: ["머동 사이트로 이동","축제 일정 보기","축제 라인업 보기","술친 구하기"]
              }
            }
        elsif @input == "술친 구하기"
            @msg = {
                message: {
                    text: "술친구를 구하기 위해 글을 써주세요.(홈페이지의 술친괌 메뉴에 글이 업로드 됩니다.)"
                },
                keyboard: {
                    type: "text"
                }
            }
        elsif @input == "1일차"
            @msg = {
                message: {
                    text: "1일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["2일차","3일차","뒤로가기"]
              }
            }
        elsif @input == "2일차"
            @msg = {
                message: {
                    text: "2일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차","3일차","뒤로가기"]
              }
            }
        elsif @input == "3일차"
            @msg = {
                message: {
                    text: "3일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차","2일차","뒤로가기"]
              }
            }
        elsif @input == "뒤로가기"
            @msg = {
                message: {
                    text: "뒤로가기를 눌렀습니다."
                },
                keyboard: {
                type: "buttons",
                buttons: ["머동 사이트로 이동","축제 일정 보기","축제 라인업 보기","술친 구하기"]
              }
            }    
        else
            message_pusher = Message.new
            message_pusher.body = @input
            message_pusher.save
            
            message = Hunting.new
            message.title = "플친에서 작성 된 글입니다."
            message.content = @input
            message.save
            
            # Hunting.content = params[@input]
            # Hunting.save
            
            @msg = {
                message: {
                    text: "글이 정상적으로 등록되었습니다."
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["머동 사이트로 이동","축제 일정 보기","축제 라인업 보기","술친 구하기"]
                }
            }
        end
        
        render json: @msg
    end
end

class Message < ApplicationRecord
    after_commit :create_message_notification, on: :create

    #푸셔 메시지 create
    def create_message_notification
        Pusher.trigger('dashboard', 'create', self.as_json) #(channer_name, event_name, data)
    end
end

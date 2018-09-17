json.extract! all_notice, :id, :title, :content, :created_at, :updated_at
json.url all_notice_url(all_notice, format: :json)

FactoryBot.define do
  factory :destination do
    sequence :name do |n|
      "Lakewood #{n}"
    end
    zip "80215"
    description "Best Ever!"
    image_url " http://www.city2map.com/images/city/lakewood_6_us.jpg"
  end
end

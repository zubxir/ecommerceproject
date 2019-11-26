# frozen_string_literal: true

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
#######################
data = ActiveSupport::JSON.decode(File.read('db/brands.json'))
# data.each do |term|
#   Product.create(
#     productname: term[0],
#     category_id: Faker::Number.within(range: 1..4)
#   )
# end

# data.each do |term|
  # puts term[1]
  term[1].each do |prod|
    # puts prod['term']
    Product.create(
      productname: prod['term'],
      category_id: Faker::Number.within(range: 1..4),
      description: Faker::Food.description,
      price: Faker::Number.decimal(l_digits: 2),
      quantity: Faker::Number.within(range: 1..25)
    )
  end
end

namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end



# run $rake todo:delete_items  to delete items older than seven days
#     $bundle exec rake -T     to see a list of all rake tasks

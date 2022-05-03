class AddAdminUser < ActiveRecord::Migration[6.1]
  def change
    User.find_or_create_by(name: 'Aleksey Boldyrev', email: 'aleksey.boldyrev@gmail.com').update(admin: true)
  end
end

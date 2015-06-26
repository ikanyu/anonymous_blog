class CreateBlogs < ActiveRecord::Migration
	def change
		create_table :posts do |t|
		  t.string  :title
		  t.string  :content

		  t.timestamps null: false
		end

		create_table :post_tags do |t|
		  t.integer  :post_id
		  t.integer  :tag_id

		  t.timestamps null: false
		end

		create_table :tags do |t|
		  t.string  :name

		  t.timestamps null: false
		end
	end
end


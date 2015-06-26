require 'faker'

module TagsImporter
  def self.import
    5.times do
      Tag.create    :name   =>  Faker::Commerce.department(1, true)
    end
  end
end

module PostsImporter
  def self.import
    5.times do
      Post.create   :title    => Faker::Lorem.sentence(1, true),
                    :content  => Faker::Lorem.sentence(1, true)
    end
  end
end

TagsImporter.import
PostsImporter.import


posts = Post.all

posts.each do |post| 
  tags = Tag.all
  tags.sample.posts << post
end
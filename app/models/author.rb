class Author < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :books
  has_many :comments , :class_name => 'FunComment' ,
    :foreign_key => 'author_no' ,
    :conditions => { :deleted => false }
end

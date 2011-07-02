# coding: utf-8

class ViewController < ApplicationController
  def form_tag
    @book = Book.new
  end

  def form_for
    @book = Book.new
  end
  
  def col_select
    @book = Book.new(:publish => '技術評論社')
    @books = Book.select('DISTINCT publish')
  end
  
  def group_select
    @review = Review.new
    @authors = Author.all
  end
  
  def fields
    @user = User.find(1)
  end
end

class MusicListsController < ApplicationController
  before_action :logged_in_user
  def create
    album = Album.find_by(id: params[:album_id])
    album.out_puts_music_list
    send_file "public/#{album.name}曲リスト.txt"
  end
end

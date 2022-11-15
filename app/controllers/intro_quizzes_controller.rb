class IntroQuizzesController < ApplicationController
  def show
    @q_num = 3
    @ids = (1..Music.all.length).to_a.sample(@q_num)
    @musics = Music.all
    @answers = []
    require 'aws-sdk-s3'
    s3 = Aws::S3::Client.new
    signer = Aws::S3::Presigner.new(client: s3)
    @ids.each do |id|
      music = Music.find_by(id: id)
      url = signer.presigned_url(:get_object, 
                                  bucket: 'kitchotifyappstrage',
                                  key: "audio/#{music.album.id}/#{music.audio_path}",
                                  expires_in: 7200)
      @answers.push({url: url, name: music.name, artist: music.artist})
    end
    gon.answers_j = @answers
    gon.ids = @ids
    gon.q_num = @q_num
  end

  def index
  end
end

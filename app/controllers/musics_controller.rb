class MusicsController < ApplicationController
  def index
    @music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
    @musics = @music_card.musics.order(track_number: "ASC")
  end
  
  def new
    @music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
    @music = Music.new()
  end

  def create
    @music = Music.new(music_params)
    @music.music_card_id = params[:music_card_id]

    @music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
    musics = @music_card.musics
    @music.track_number = musics.size + 1
    if @music.save
    else
      render :new
      return
    end
    redirect_to music_card_musics_url(@music_card), notice: "音源が登録されました"
  end

  def moveup
    music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)

    music1 = music_card.musics.find(params[:music_id])
    if music1.track_number != 1
      music2 = music_card.musics.find_by(track_number: music1.track_number-1)
      music1.track_number = music1.track_number - 1
      music2.track_number = music2.track_number + 1
      music1.save!
      music2.save!
      # TodoレンダーとかAjaxに変えたいね
      redirect_to music_card_musics_url(music_card), notice: "上に移動しました"
    else
      redirect_to music_card_musics_url(music_card)
    end
  end

  def movedown
    music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
    music1 = music_card.musics.find(params[:music_id])
    if music1.track_number != music_card.musics.count
      music2 = music_card.musics.find_by(track_number: music1.track_number+1)
      music1.track_number = music1.track_number + 1
      music2.track_number = music2.track_number - 1
      music1.save!
      music2.save!
      redirect_to music_card_musics_url(music_card), notice: "上に移動しました"
    else
      redirect_to music_card_musics_url(music_card)
    end
  end

  def music_destroy
    music_card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
    music = music_card.musics.find(params[:music_id])
    musics = music_card.musics.order(track_number: "DESC")
    if music.track_number != musics.count
      musics.each do |m|
        m.track_number = m.track_number - 1
        m.save!
        break if m.track_number == music.track_number
      end
    end
    music.destroy!
    redirect_to music_card_musics_url(music_card)
  end

  private

  def music_params
    params.require(:music).permit(:title, :artist_name, :music)
  end
end

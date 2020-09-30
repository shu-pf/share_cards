class MusicCardsController < ApplicationController
  def index
    @music_cards = current_user.music_cards
  end

  def new
    @music_card = MusicCard.new()
  end

  def create
    @music_card = MusicCard.new(music_card_params)
    @music_card[:user_id] = current_user.id

    if @music_card.save
    else
      render :new
      return
    end

    redirect_to music_card_musics_url(@music_card), notice: "カードが登録されました"
  end

  private

  def music_card_params
    params.require(:music_card).permit(:title, :artist_name, :card_img)
  end
end

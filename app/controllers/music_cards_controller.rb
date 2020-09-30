class MusicCardsController < ApplicationController
  def index
    @music_cards = current_user.music_cards
  end

  def show
    @card = MusicCard.find_by(id: params[:id], user_id: current_user.id)
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

  def edit_title
    @card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
  end

  def edit_auther_name
    @card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
  end

  def edit_card_img
    @card = MusicCard.find_by(id: params[:music_card_id], user_id: current_user.id)
  end

  def update
    card = MusicCard.find_by(id: params[:id], user_id: current_user.id)
    flag = card.update(music_card_params)
    if flag
    else
      redirect_to music_card_url(card), alert: "更新に失敗しました"
      return
    end
    redirect_to music_card_url(card), notice: "更新しました。"
  end

  private

  def music_card_params
    if params[:music_card]
      params.require(:music_card).permit(:title, :artist_name, :card_img)
    else
      # contentがからの場合の処理
      # とりあえずなので要修正
      params[:music_card] = {title: ""}
    end
  end
end

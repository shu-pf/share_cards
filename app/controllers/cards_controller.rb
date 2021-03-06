class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end

  def show
    # 他の人がアップしているカードを見れない様にする
    @card = Card.find_by(id: params[:id], user_id: current_user.id)
  end

  def edit_title
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def edit_auther_name
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def edit_content
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def edit_card_img
    @card = Card.find_by(id: params[:card_id], user_id: current_user.id)
  end

  def update
    card = Card.find_by(id: params[:id], user_id: current_user.id)
    flag = card.update(card_params)
    if flag
    else
      redirect_to card_url(card), alert: "更新に失敗しました"
      return
    end
    redirect_to card_url(card), notice: "更新しました。"
  end

  def destroy
    card = Card.find_by(id: params[:id], user_id: current_user.id)
    # Todo:関連する物の削除
    card.destroy!
    redirect_to cards_url
  end

  def new
    @card = Card.new()
  end

  def create
    @card = Card.new(card_params)
    @card[:user_id] = current_user.id

    if @card.save
    else
      render :new
      return
    end

    redirect_to new_card_license_group_url(@card), notice: "カードが登録されました"
  end

  def select
  end

  private

  def card_params
    if params[:card]
      params.require(:card).permit(:title, :auther_name, :content, :card_img)
    else
      # contentがからの場合の処理
      # とりあえずなので要修正
      params[:card] = {title: ""}
    end
  end
end

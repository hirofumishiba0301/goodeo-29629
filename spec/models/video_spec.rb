require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '動画の投稿' do
    before do
      @user = FactoryBot.create(:user)
      @video = FactoryBot.build(:video, user_id: @user.id)
    end

    context '正しく動画を投稿できること' do
      it '全ての値が正しく保存されていれば保存されること' do
        expect(@video).to be_valid
      end
    end

    context '動画を正しく投稿できないとき' do
      it 'movieが空では登録できない' do
        @video.movie = nil
        @video.valid?
        expect(@video.errors.full_messages).to include("Movie can't be blank")
      end

      it 'nameが空では登録できない' do
        @video.name = nil
        @video.valid?
        expect(@video.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @video.info = nil
        @video.valid?
        expect(@video.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが空では登録できない' do
        @video.category_id = nil
        @video.valid?
        expect(@video.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが1では登録できない' do
        @video.category_id = 1
        @video.valid?
        expect(@video.errors.full_messages).to include('Category must be other than 1')
      end

      it 'userが紐づいてないと保存できない' do
        @video.user = nil
        @video.valid?
        expect(@video.errors.full_messages).to include('User must exist')
      end
    end
  end
end

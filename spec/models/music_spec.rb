require 'rails_helper'

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music.file = fixture_file_upload("app/assets/musics/water solution.mp3")
  end

  describe '楽曲の保存' do
    context "楽曲が保存できる場合" do
      it "アーティスト名、曲名、音源データがあれば楽曲は保存される" do
        expect(@music).to be_valid
      end
      it "楽曲イメージがなくても楽曲は保存される" do
        @music.image = ""
        expect(@music).to be_valid
      end
    end

    context "楽曲が保存できない場合" do
      it "アーティスト名がないと楽曲は保存できない" do
        @music.artist = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Artist can't be blank")
      end
      it "曲名がないと楽曲は保存できない" do
        @music.title = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Title can't be blank")
      end
      it "音源データがないと楽曲は保存できない" do
        @music.file = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("File can't be blank")
      end
      it "ユーザーが紐付いていないと楽曲は保存できない" do
        @music.user = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("User must exist")
      end
    end
  end
end

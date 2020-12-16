# frozen_string_literal: true

require "rails_helper"

RSpec.describe Music, type: :model do
  before do
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music.file = fixture_file_upload("app/assets/musics/water solution.mp3")
  end

  describe "楽曲の保存" do
    context "楽曲が保存できる場合" do
      it "アーティスト名、曲名、音源データがあれば楽曲は保存される" do
        expect(@music).to be_valid
      end
      it "楽曲イメージがなくても楽曲は保存される" do
        @music.image = nil
        expect(@music).to be_valid
      end
    end

    context "楽曲が保存できない場合" do
      it "アーティスト名がないと楽曲は保存できない" do
        @music.artist = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("アーティスト名を入力してください")
      end
      it "曲名がないと楽曲は保存できない" do
        @music.title = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("曲名を入力してください")
      end
      it "音源データがないと楽曲は保存できない" do
        @music.file = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("音源データを入力してください")
      end
      it "ユーザーが紐付いていないと楽曲は保存できない" do
        @music.user = nil
        @music.valid?
        expect(@music.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

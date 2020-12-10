# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメントの保存" do
    context "コメントが保存できる場合" do
      it "textがあり、userとmusicが紐づいていればコメントは保存される" do
        expect(@comment).to be_valid
      end
    end

    context "コメントが保存できない場合" do
      it "textが空だと保存できない" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it "userが紐づいていなければ保存できない" do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "musicが紐づいていなければ保存できない" do
        @comment.music = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Music must exist")
      end
    end
  end
end

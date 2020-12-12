require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music.save
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは楽曲詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@music.user)
    # 楽曲詳細ページに遷移する
    visit music_path(@music)
    # フォームに情報を入力する
    fill_in "comment_text", with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{find('input[name="commit"]').click}.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq music_path(@music)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content("#{@comment}")
  end
end

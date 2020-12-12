require 'rails_helper'

RSpec.describe "Musics", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @music = FactoryBot.build(:music)
  end

  context '楽曲投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_music_path
      # フォームに情報を入力する
      attach_file 'music_image', "app/assets/images/no_image_square.jpg"
      attach_file 'music_file', "app/assets/musics/water solution.mp3"
      fill_in 'アーティスト名', with: @music.artist
      fill_in '曲名', with: @music.title
      # 送信するとMusicモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Music.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # トップページには先ほど投稿した内容の楽曲が存在することを確認する（アーティスト名）
      expect(page).to have_content(@music_artist)
      # トップページには先ほど投稿した内容の楽曲が存在することを確認する（曲名）
      expect(page).to have_content(@music_title)
    end
  end

  context '楽曲投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end

RSpec.describe '楽曲編集', type: :system do
  before do
    @music1 = FactoryBot.build(:music)
    @music1.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music1.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music1.save
    @music2 = FactoryBot.build(:music)
    @music2.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music2.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music2.save
  end
  context '楽曲編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した楽曲の編集ができる' do
      # 楽曲1を投稿したユーザーでログインする
      sign_in(@music1.user)
      # 楽曲1の詳細ページへ遷移する
      visit music_path(@music1)
      # 楽曲1に「編集」ボタンがあることを確認する
      expect(page).to have_content('編集する')
      # 編集ページへ遷移する
      visit edit_music_path(@music1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#music_artist').value
      ).to eq @music1.artist
      expect(
        find('#music_title').value
      ).to eq @music1.title
      # 投稿内容を編集する
      fill_in 'music_artist', with: "#{@music1.artist}+編集したアーティスト名"
      fill_in 'music_title', with: "#{@music1.title}+編集した曲名"
      # 編集しても楽曲モデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Music.count }.by(0)
      # 編集完了画面に遷移したことを確認する
      expect(current_path).to eq music_path(@music1)
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容の楽曲が存在することを確認する（アーティスト名）
      expect(page).to have_content("#{@music1.artist}+編集したアーティスト名")
      # トップページには先ほど変更した内容の楽曲が存在することを確認する（曲名）
      expect(page).to have_content("#{@music1.title}+編集した曲名")
    end
  end
  context '楽曲編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した楽曲の編集画面には遷移できない' do
      # 楽曲1を投稿したユーザーでログインする
      sign_in(@music1.user)
      # 楽曲2の詳細ページへ遷移
      visit music_path(@music2)
      # 楽曲2に「編集する」ボタンがないことを確認する
      expect(page).to have_no_content("編集する")
    end
    it 'ログインしていないと楽曲の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 楽曲1の詳細ページに遷移
      visit music_path(@music1)
      # 楽曲1に「編集する」ボタンがないことを確認する
      expect(page).to have_no_content("編集する")
      # 楽曲2の詳細ページに遷移
      visit music_path(@music2)
      # 楽曲2に「編集する」ボタンがないことを確認する
      expect(page).to have_no_content("編集する")
    end
  end
end

RSpec.describe '楽曲削除', type: :system do
  before do
    @music1 = FactoryBot.build(:music)
    @music1.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music1.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music1.save
    @music2 = FactoryBot.build(:music)
    @music2.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music2.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music2.save
  end
  context '楽曲削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した楽曲の削除ができる' do
      # 楽曲1を投稿したユーザーでログインする
      sign_in(@music1.user)
      # 楽曲1の詳細ページへ遷移
      visit music_path(@music1)
      # 投稿を削除する
      page.accept_confirm do
        find_link('削除する', href: music_path(@music1)).click
      end
      # トップページに遷移したことを確認する
      expect(current_path).to eq root_path
      # トップページには楽曲1の内容が存在しないことを確認する（アーティスト名）
      expect(page).to have_no_content("#{@music1.artist}")
      # トップページには楽曲1の内容が存在しないことを確認する（曲名）
      expect(page).to have_no_content("#{@music1.title}")
    end
  end
  context '楽曲削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した楽曲の削除ができない' do
      # 楽曲1を投稿したユーザーでログインする
      sign_in(@music1.user)
      # 楽曲2の詳細ページへ遷移
      visit music_path(@music2)
      # 楽曲2に「削除する」ボタンが無いことを確認する
      expect(page).to have_no_content("削除する")
    end
    it 'ログインしていないと楽曲の削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 楽曲1の詳細ページへ遷移
      visit music_path(@music1)
      # 楽曲1に「削除する」ボタンが無いことを確認する
      expect(page).to have_no_content("削除する")
      # 楽曲2の詳細ページへ遷移
      visit music_path(@music2)
      # 楽曲2に「削除する」ボタンが無いことを確認する
      expect(page).to have_no_content("削除する")
    end
  end
end

RSpec.describe '楽曲詳細', type: :system do
  before do
    @music = FactoryBot.build(:music)
    @music.image = fixture_file_upload("app/assets/images/no_image_square.jpg")
    @music.file = fixture_file_upload("app/assets/musics/water solution.mp3")
    @music.save
  end
  it 'ログインしたユーザーは楽曲詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@music.user)
    # 詳細ページに遷移する
    visit music_path(@music)
    # 詳細ページに楽曲の内容が含まれている
    expect(page).to have_content("#{@music.artist}")
    expect(page).to have_content("#{@music.title}")
    # コメント用のフォームが存在する
    expect(page).to have_content("コメントする")
  end
  it 'ログインしていない状態で楽曲詳細ページに遷移できるがコメント投稿欄が表示されない' do
    # トップページに移動する
    visit root_path
    # 詳細ページに遷移する
    visit music_path(@music)
    # 詳細ページに楽曲の内容が含まれている
    expect(page).to have_content("#{@music.artist}")
    expect(page).to have_content("#{@music.title}")
    # フォームが存在しないことを確認する
    expect(page).to have_no_content("コメントする")
  end
end
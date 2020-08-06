require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
  end

  it "ログインしていない場合、サインインページに移動する" do
    #トップページに移動する
    visit root_path
    #ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
  end

  it "ログインに成功し、ルートパスに遷移する" do
    #あらかじめ、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #サインインページへ移動する
    visit new_user_session_path
    #ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #既に保存されているユーザーのemailとpasswordを入力する
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    #ログインボタンをクリックする
    click_on "Log in"
    #ルートページに遷移することを期待する
    expect(current_path).to eq root_path
  end

  it "ログインに失敗し、再びサインインページに戻ってくる" do
    #あらかじめ、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)
    #トップページに遷移する
    visit root_path
    #ログインしていない場合、サインインページに遷移することを期待する
    expect(current_path).to eq new_user_session_path
    #誤ったユーザー情報を入力する
    fill_in "user_email", with: Faker::Internet.free_email
    fill_in "user_password", with: Faker::Internet.password
    #ログインボタンをクリックする
    click_on "Log in"
    #サインインページに遷移していることを期待する
    expect(current_path).to eq new_user_session_path
  end

end

RSpec.feature 'Items', type: :feature do
  scenario '売却済みの商品詳細ページには、「商品の編集」「削除」「購入画面に進む」ボタンが表示されない' do
    # 売却済みの商品を作成します
    sold_item = FactoryBot.create(:item, :sold)
    visit item_path(sold_item)
    expect(page).to_not have_button('商品の編集')
    expect(page).to_not have_button('削除')
    expect(page).to_not have_button('購入画面に進む')
  end

  scenario '自身が出品した売却済み商品の商品情報編集ページへ遷移しようとすると、トップページに遷移する' do
    # ユーザーとそのユーザーが出品した売却済みの商品を作成します
    user = FactoryBot.create(:user)
    sold_item = FactoryBot.create(:item, :sold, user:)
    # ユーザーでログインします
    sign_in(user)
    visit edit_item_path(sold_item)
    expect(current_path).to eq root_path
  end
end

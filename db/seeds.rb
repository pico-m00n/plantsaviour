# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EndUser.create(
    [
        {name: '鈴木太郎', email: 'sitsumon1@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '佐々木太郎', email: 'sitsumon2@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '田中太郎', email: 'sitsumon3@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '高橋花子', email: 'kaitou1@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '斎藤花子', email: 'kaitou2@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '池田花子', email: 'kaitou3@gmail.com', password: '11111111', password_confirmation: '11111111'}
    ])

Question.create(
    [
        {title: '東京のお土産で喜ばれるもの', body: '今週末東京に行きますが、東京土産で喜ばれるものありますか？', end_user_id: 1},
        {title: '好きな動物', body: '一番好きな動物は何ですか？', end_user_id: 1},
        {title: '美味しいご飯や', body: '名古屋周辺の美味しいご飯屋さん教えてください', end_user_id: 2}
    ])

Answer.create(
    [
        {body: '東京ばな奈じゃないですか？', question_id: 1, end_user_id: 4},
        {body: 'ラスクみたいなやつ', question_id: 1, end_user_id: 5},
        {body: '中華まん', question_id: 1, end_user_id: 6}
    ])

Reaction.create(
    [
        {body: '東京ばな奈いいですね', end_user_id: 1, answer_id: 1},
        {body: '猫いいですね！', end_user_id: 1, answer_id: 4},
        {body: '矢場とんいいですね！', end_user_id: 3, answer_id: 7}])

Tag.create(
    [
        {name: '育成法'},
        {name: '病害虫'},
        {name: 'サボテン'},
        {name: 'その他'}])

# activeadmin(管理画面)に入るためのユーザーです。ターミナルで「rails g active_admin:install」を実行後
# 作成されます。メールアドレスとパスワードはわかりやすく設定していますが、必要であれば変えてください。
AdminUser.create!(email: 'admin@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin') if Rails.env.development?
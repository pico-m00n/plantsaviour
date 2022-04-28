# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EndUser.create(
    [
        {name: 'DMM太郎', email: 'sitsumon1@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: 'ジョルノ・ジョバーナ', email: 'sitsumon2@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '松田龍平', email: 'sitsumon3@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '高井光一', email: 'sitsumon4@gmail.com', password: '11111111', password_confirmation: '11111111'},
        {name: '闇遊戯', email: 'sitsumon5@gmail.com', password: '11111111', password_confirmation: '11111111'},
    ])

Question.create(
    [
        {title: 'サボテンが折れちゃいました', body: 'サボテンを落としてしまい、真っ二つの状態です。助ける方法はありませんか？', end_user_id: 1},
        {title: 'ハウスに蝗の大群が...', body: '稲を育てているハウスに蝗が繁殖しまくっています。何とか退治できませんか？', end_user_id: 1},
        {title: 'あまい苺が作れません', body: '実がなるにはなるのですが、美味しくなりません。育て方にコツなどありますか？', end_user_id: 2},
        {title: '葉が白く変色しています', body: 'オリーブを育てていて、葉が白く変色したんですが、これはなにかの病気ですか？', end_user_id: 2},
        {title: '庭に変なキノコが生えてきました', body: '食べてもいいですか？', end_user_id: 2},
        {title: '今年のトマトがとても小さくて', body: '一昨年からトマトを育てているのですが、今年のトマトはとても小さくて、考えられる原因はなんでしょうか？', end_user_id: 2},
        {title: '初めての観葉植物は何がおすすめですか？', body: 'タイトルの通りです', end_user_id: 2},
    ])

TagTag.create(
    [
        {question_id: 1, tag_id: 5},
        {question_id: 2, tag_id: 2},
        {question_id: 3, tag_id: 1},
        {question_id: 2, tag_id: 5},
        {question_id: 2, tag_id: 6},
        {question_id: 2, tag_id: 1},
        {question_id: 2, tag_id: 6}
    ])

Answer.create(
    [
        {body: 'もう何をしても無駄です', question_id: 1, end_user_id: 2},
        {body: '接着剤で断面の淵をくっつけて、しばらくすれば大抵回復します', question_id: 1, end_user_id: 3},
    ])

Post.create(
    [
        {title: '基本的な土壌の育て方', body: '', end_user_id: 2},
        {title: 'サボテンの育て方', body: '', end_user_id: 2},
        {title: '種子消毒の基本', body: '', end_user_id: 2},
    ])

PostTag.create(
    [
        {post_id: 1, tag_id: 3},
        {post_id: 2, tag_id: 2},
        {post_id: 3, tag_id: 1},
    ])

Reaction.create(
    [
        {body: 'そいつはどうかな', end_user_id: 5, answer_id: 1},
        {body: '私のもその方法で治りました', end_user_id: 4, answer_id: 2},
    ])

Tag.create(
    [
        {name: '育成法'},
        {name: '病害虫'},
        {name: 'サボテン'},
        {name: '観葉植物'},
        {name: '応急処置'},
        {name: 'その他'}
    ])


AdminUser.create!(email: 'admin@gmail.com', password: 'adminadmin', password_confirmation: 'adminadmin')
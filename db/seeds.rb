# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Image.destroy_all
Entertainer.destroy_all
Tag.destroy_all

# TODO: タグ考える

nagayan = Entertainer.create(name: 'ながやん')
nagayan.images.create(path: "1", title: "俺は就職活動中の精子！夢はオーマン・コーポレーションに入ることさ！だけどほとんどはスコッティとかいうブラック企業に使われて死んでいくらしいんだ。", file_type: 'jpg')
nagayan.images.create(path: "2", title: "オーマン・コーポレーションに入社できても、選ばれるのは一人だけさ。他はみんな解雇されちまうんだ。", file_type: 'jpg')
nagayan.images.create(path: "3", title: "帰って晩飯食うかシコルカどっちかの時間しかねえなって思って飯食いながらシコった末、ごはんに欲情するようになった", file_type: 'jpg')
nagayan.images.create(path: "4", title: "ながやん「えーっ。それはイヤかも。わたし人間さんとエッチしたいよ〜っ」", file_type: 'jpg')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   id: 1,
   name: '管理人',
   email: 'admin@test.com',
   password: 'testtest'
   )
Genre.create!(
   id: 1,
   name: '解剖学'
   )
Treatment.create!(
   [
      {
         id: 1,
         name: "全身整体・バランス整体"
      },
      {
         id: 2,
         name: "カイロプラクティック"
      },
      {
         id: 3,
         name: "指圧・あん摩マッサージ"
      },
      {
         id: 4,
         name: "スポーツ整体"
      },
      {
         id: 5,
         name: "骨盤矯正・産後整体"
      },
      {
         id: 6,
         name: "姿勢矯正"
      },
      {
         id: 7,
         name: "美容整体"
      },
   ]
   )
Chiropractor.create!(
   [
      {
         id: 1,
         email: "micheal@test.com",
         treatment_id: 4,
         nickname: "Micheal",
         name: "Micheal Richards",
         postal_code: "6638152",
         address_city: "兵庫県西宮市甲子園町",
         address_street: "１−８２",
         phone_number: "09000000000",
         image_id: "c7f495e148d32f885960e8012d7a5fb52ed3f3ce96014d98fe8d54f43597",
         fare: 0,
         service_charge: 6000,
         age: 32,
         sex: "male",
         nearest_station: "新宿駅",
         treatment_time: 30,
         chiropractors_status: true,
         password: "testpass1"
      },
      {
         id: 2,
         email: "olivia@test.com",
         treatment_id: 7,
         nickname: "Olivia",
         name: "Olivia Rodrigo",
         postal_code: "1120004",
         address_city: "東京都文京区後楽１丁目",
         address_street: "３−６１",
         phone_number: "09000000000",
         image_id: "430aea2dc7a6626f33b2666e6c03e909885a89fe2508bb63850febd95f08",
         fare: 0,
         service_charge: 8000,
         age: 26,
         sex: "female",
         nearest_station: "水道橋駅",
         treatment_time: 30,
         chiropractors_status: true,
         password: "testpass2"
      },
      {
         id: 3,
         email: "lohn@test.com",
         treatment_id: 6,
         nickname: "John",
         name: "John Winston Ono Lennon",
         postal_code: "1600013",
         address_city: "東京都新宿区霞ヶ丘町",
         address_street: "３−１",
         phone_number: "09000000000",
         image_id: "36c429738c6348c97f7eb33013464b97f41a5fe61e412fe2d6e0a09675bf",
         fare: 0,
         service_charge: 3800,
         age: 29,
         sex: "male",
         nearest_station: "外苑前駅",
         treatment_time: 30,
         chiropractors_status: true,
         password: "testpass3"
      },
      {
         id: 4,
         email: "khan@test.com",
         treatment_id: 3,
         nickname: "Khan",
         name: "Irrfan Khan",
         postal_code: "1600013",
         address_city: "埼玉県所沢市上山口",
         address_street: "２１３５",
         phone_number: "09000000000",
         image_id: "f44303e043233fdb757ddef62364ef9d3ee138232ec50fdbee9952b94d30",
         fare: 0,
         service_charge: 4600,
         age: 68,
         sex: "male",
         nearest_station: "西武球場前駅",
         treatment_time: 30,
         chiropractors_status: true,
         password: "testpass4"
      }
      ]
   )
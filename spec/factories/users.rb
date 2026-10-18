FactoryBot.define do
  factory :user do
    transient do
      gimei_last  { %w[山田 佐藤 田中 鈴木 木村 高橋 渡辺 小林].sample}
      gimei_first { %w[太郎 花子 一郎 久美子 健司 洋子 翼 桜].sample}

      gimei_last_kana  { %w[ヤマダ サトウ タナカ スズキ キムラ タカハシ ワタナベ コバヤシ].sample}
      gimei_first_kana { %w[タロウ ハナコ イチロウ クミコ ケンジ ヨウコ ツバサ サクラ].sample}
    end

    nickname              {Faker::Name.name} 
    first_name            {gimei_first}
    last_name             {gimei_last}
    first_name_kana       {gimei_first_kana}
    last_name_kana        {gimei_last_kana}
    
    sequence(:email)      {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 4)+ '1a'}
    password_confirmation {password}
    
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end

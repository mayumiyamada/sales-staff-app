#営業員専用アプリケーション


##スケジュール管理、販売商品のリアルな口コミ投稿、営業サポートや人事等困りごとがあればチャットで問い合わせできる機能、各部署から営業職員にむけた知識の共有を新着情報で発信できる掲示板機能


# テーブル設計

## users テーブル
| Column              | Type   | Options                   |
| ------------------  | ------ | -----------               |
| employee_id_number  | string | null: false               |
| name                | string | null: false               |
| name_kana           | string | null: false               |
| email               | string | null: false ,unique: true |
| encrypted_password  | string | null: false               |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :tweets
- has_many :calendars


## rooms テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| subject   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room

## tweets テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| name       | string     | null: false                    | 
| hotel_name | string     | null: false                    | 
| content    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## calendars テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| title      | string     | null: false                    | 
| content    | text       | null: false                    |
| start_time | datetime   | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user

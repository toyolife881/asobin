# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_day          | date       | null: false                    |
| child_age_id       | integer    |                                |


### Association

- has_many :plays
- has_many :favorite_plays
- has_many :achivement_plays



## plays テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| play_name          | string     | null: false                    |
| preparation        | text       | null: false                    |
| how_to_play        | text       | null: false                    |
| play_category_id   | integer    | null: false                    |
| target_age_id      | integer    | null: false                    |
| estimated_time_id  | integer    |                     |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user



## favorite_plays テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| play               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :play



## achivement_play テーブル

 Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| play               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :play


# アプリケーション名

https://i.gyazo.com/b24d1a29d765b8859d1d0101f59b6508.jpg

# アプリケーション概要

休日にちょっとそこまでお出かけしたいなと思った際に、目的地が決まらず、せっかくの1日を無駄に過ごすことが多かった。
そんな時に他の人がどんな場所へ、どんなコースで訪れるのかを見れるものがあればいいなと思った。
観光サイトは膨大すぎる上に観光地が多いため、気軽さがない。
InstagramやTwitterは住所や電話番号が載っていないから、ナビに入れるときに手間がかかる。
美術館や博物館・イベントも気がついたら終わっている。
記録しておきたいけど、InstagramやTwitterはコメントやいいねの他人が気になる。
気軽に行けて、目的地の情報もある程度あって、イベントなどの通知が来てくれるものだといいなと思っていた。
また、他人を気にせず、好きにまとめて記録できるものがあればと考えていた。
これらを解決したく、今回のアプリ開発に至った。

# URL

未デプロイのため、デプロイ後記載

# テスト用アカウント

・投稿者用アカウント
  email: abc@gmail.com
  password: abc123
・閲覧者用アカウント
  email: 123@gmail.com
  password: def456

# 利用方法
  新規登録後、投稿ページにてページ情報・スポット情報を登録することができる。
  登録後、トップページの新規投稿一覧に表示。
  マイページにてログインユーザーの投稿一覧を見ることができる。
  他のユーザーの投稿ページを一覧またはキーワードで検索。
  画像またはタイトルをクリックすると詳細ページへ遷移する。
  詳細ページのユーザー名をクリックするとそのユーザーのマイページへ遷移。
  詳細ページにていいねをつけることができる。

# 目指した課題解決

| Who            | What                |
| -------------- | --------------------|
| 目的地に悩む人   | 目的地を探す手間を短縮  |
| 記録したい人     | 記録をメインにしたい   |

# 洗い出した要件

| 機能             | 目的                | 詳細                                   | ストーリー                         |
| --------------- | ------------------- | ------------------------------------- | -------------------------------- |
| ユーザー管理機能   | 使用機能を限定するため | nickname,email,パスワードは必須登録させる  | 画像とメッセージを登録することができる |
| ページ投稿機能    | 記録するため          | ページ・スポット情報を登録させる            | 駐車場は選択肢で選ぶ                |
| タグ機能         | 検索をしやすくするため  | ページ情報にタグ付けさせる                 | タグで検索できるようにする           |
| 検索機能         | 検索するため          | タイトルやタグ、カテゴリーで検索させる       | ユーザー登録者飲み利用可に設定する     |
| いいね機能       | 投稿意欲をあげるため    | リロードせずに、いいねをつけることができる   | いいねのカウントが見えるようにする     |


# 実装した機能についての画像やGIFおよびその説明
未実装

# 実装予定の機能

・ユーザー管理機能
  ・ログイン状態
    ページ投稿機能が利用できる
    他のユーザーのページに対して、いいね機能が使える
    マイページにて自分が投稿した一覧が表示される
    検索機能が使える

  ・ログアウト状態
    他のユーザーのページを見ることができる
    ページ投稿機能・検索機能・いいね機能は利用できない

・ページ投稿機能
  ログイン状態のみ利用できる。
  https://i.gyazo.com/6d52ee9866fc1f483cfd5e33e9be37d3.png
  このボタンを押すと投稿ページへ遷移する。
  ページ情報（ページタイトル・コースに対する一言・所要時間・交通手段・作成日・タグ）
  スポット情報（場所の写真・場所名・住所・電話番号・駐車場の有無・コメント・ジャンルのアイコン）を登録することができる。
  登録後は詳細ページへ遷移。
  表示はページ情報・スポット情報に加え、作成者であるユーザー情報も表示される。

・いいね機能
  ログイン状態のみ利用できる。
  ログインユーザー以外のユーザーが作ったページに「いいね」をつけることができる。

・タグ機能
  ログイン状態のみ利用できる。
  作成者が投稿時にタグをつけることができる。

・検索機能
  ログイン状態のみ利用できる。
  検索フォームより、タイトルに一部一致するもの・ジャンル検索・交通手段・所要時間・住所・タグで検索することができる。
  検索結果を一覧に表示し、選択したものの詳細ページに遷移することができる。

# データベース設計

ER図
https://i.gyazo.com/6aec6c327b7493028c0b144ea953ec5d.png

・テーブル設計
## usersテーブル
| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| text               | text   |                           |
| image              | text   |                           | カラムなし

### Association

- has_many :pages
- has_many :likes

## pages テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| page_title         | string     | null: false                    |
| page_comment       | string     |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :spots
- has_many :likes
- has_many :page_tags
- has_many :tags

## spots テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| spot_name          | string     | null: false                    |
| spot_address       | string     | null: false                    |
| spot_tel           | string     | null: false                    |
| spot_parking       | string     | null: false                    |
| spot_comment       | text       |                                |
| category           | integer    | null: false, default: 0        |
| spot_images        | text       | null: false                    | カラムなし
| page               | references | null: false, foreign_key: true |

### Association

- belongs_to :page

## likes テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| page               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :page

## tags テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| tag_name           | string     | null: false                    |

### Association

- has_many :page_tags
- has_many :pages

## page_tags テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| tag                | references | null: false, foreign_key: true |
| page               | references | null: false, foreign_key: true |

### Association

- belongs_to :tag
- belongs_to :page

# ローカルでの動作方法
未実装

# 開発環境
増減あるため、後ほど記入

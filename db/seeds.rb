# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# リセット
Task.delete_all
Task.connection.execute("ALTER TABLE tasks AUTO_INCREMENT = 0;")
Category.delete_all
Category.connection.execute("ALTER TABLE categories AUTO_INCREMENT = 0;")
Client.delete_all
Client.connection.execute("ALTER TABLE clients AUTO_INCREMENT = 0;")
User.delete_all
User.connection.execute("ALTER TABLE users AUTO_INCREMENT = 0;")
Department.delete_all
Department.connection.execute("ALTER TABLE departments AUTO_INCREMENT = 0;")
Status.delete_all
Status.connection.execute("ALTER TABLE statuses AUTO_INCREMENT = 0;")

# 追加
Department.create!(
  [
    {
      id: 1,
      name: "なし"
    },
    {
      id: 2,
      name: "テスト1部"
    },
    {
      id: 3,
      name: "テスト2部"
    }
  ]
)

Status.create!(
  [
    {
      id: 1,
      name: "未了",
    },

    {
      id: 2,
      name: "完了",
    },  
  ]
)

User.create!(
  [
    {
      id: 1,
      email: "admin@admin",
      name: "管理者",
      password: "admin1",
      authority: 0,
      admin: 1,
      department_id: 1,
    },

    {
      id: 2,
      email: "boss@boss",
      name: "上司",
      password: "boss01",
      authority: 1,
      admin: 0,
      department_id: 2,
    },
    
    {
      id: 3,
      email: "employee@e1",
      name: "部下1",
      password: "employee1",
      authority: 0,
      admin: 0,
      department_id: 2,
    },

    {
      id: 4,
      email: "employee@e2",
      name: "部下2",
      password: "employee2",
      authority: 0,
      admin: 0,
      department_id: 3,
    },
  ]
)

Client.create!(
  [
    {
      id: 1,
      user_id: 2,
      name: "社長",
    },

    {
      id: 2,
      user_id: 2,
      name: "取引先1",
    },
    
    {
      id: 3,
      user_id: 3,
      name: "課長",
    },

    {
      id: 4,
      user_id: 3,
      name: "取引先2",
    },

    {
      id: 5,
      user_id: 4,
      name: "取引先3",
    },

    {
      id: 6,
      user_id: 4,
      name: "課長",
    },
  ]
)

Category.create!(
  [
    {
      id: 1,
      user_id: 2,
      name: "会議資料作成",
    },

    {
      id: 2,
      user_id: 2,
      name: "データ分析",
    },
    
    {
      id: 3,
      user_id: 3,
      name: "営業資料作成",
    },

    {
      id: 4,
      user_id: 3,
      name: "事業経費処理",
    },

    {
      id: 5,
      user_id: 4,
      name: "契約書作成",
    },

    {
      id: 6,
      user_id: 4,
      name: "棚卸",
    },
  ]
)

Task.create!(
  [
    {
      id: 1,
      user_id: 2,
      client_id: 1,
      category_id: 1,
      name: "経営戦略会議資料",
      duedate: "2020-06-01",
    },

    {
      id: 2,
      user_id: 2,
      client_id: 1,
      category_id: 2,
      name: "事業実績データ分析",
      duedate: "2020-06-01",
      content: "直近3年分の事業実績データの業界別、取引先別、時期別の分析",
    },
  
    {
      id: 3,
      user_id: 3,
      client_id: 4,
      category_id: 3,
      duedate: "2020-06-01",
    },

    {
      id: 4,
      user_id: 3,
      client_id: 4,
      category_id: 3,
      name: "経費チェック",
      duedate: "2020-06-20",
    },

    {
      id: 5,
      user_id: 4,
      client_id: 5,
      category_id: 5,
      name: "売買基本契約書法務確認",
      duedate: "2020-05-01",
      content: "第◯条、第◯条の変更確認",
    },

    {
      id: 6,
      user_id: 4,
      client_id: 6,
      category_id: 6,
      name: "4月末棚卸",
      duedate: "2020-05-01",
    },
  ]
)
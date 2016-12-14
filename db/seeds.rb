# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Issue.create(id: 1, name: 'Test1', date: Date.current)
Issue.create(id: 2, name: 'Test2', date: Date.current)
Issue.create(id: 3, name: 'Test3', date: Date.current)
Article.create(title: 'Article1', desc: 'Desc1', url: 'Url1', date: Date.current, tags: ['learning', 'AI'], issue_id: 1)
Article.create(title: 'Article2', desc: 'Desc2', url: 'Url2', date: Date.current, tags: ['Tech', 'AI'], issue_id: 1)
Article.create(title: 'Article3', desc: 'Desc3', url: 'Url3', date: Date.current, tags: ['Talk', 'AI'], issue_id: 1)
Article.create(title: 'Article4', desc: 'Desc4', url: 'Url4', date: Date.current, tags: ['OS', 'AI'], issue_id: 2)
Article.create(title: 'Article5', desc: 'Desc5', url: 'Url5', date: Date.current, tags: ['Software', 'AI'], issue_id: 2)
Article.create(title: 'Article6', desc: 'Desc6', url: 'Url6', date: Date.current, tags: ['learning', 'AI'], issue_id: 3)
Article.create(title: 'Article7', desc: 'Desc7', url: 'Url7', date: Date.current, tags: ['learning', 'AI'], issue_id: 3)
Article.create(title: 'Article8', desc: 'Desc8', url: 'Url8', date: Date.current, tags: ['learning', 'AI'], issue_id: 3)

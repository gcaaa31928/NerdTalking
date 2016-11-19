require 'test_helper'

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest

    test 'cannot create article if have no access key' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url"}
        assert_response 403
    end

    test 'cannot create article if wrong token' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'create article' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url",
                      date: Date.current.to_s, tags: ['ch', 'en']},
             headers: {'AUTHORIZATION': 'access_token'}
        article = Article.first
        assert_equal("can create", article.title)
        assert_equal("desc", article.desc)
        assert_equal("url", article.url)
        assert_equal(['ch', 'en'], article.tags)
        assert_equal(Date.current, article.date)
        assert_response :success
    end

    test 'get article' do
        get '/api/articles'
        assert_response :success
        body = JSON.parse(@response.body)
        article = body['data']
        assert_equal(article.length, 2)
        assert_equal(article[0]['title'], 'title')
    end

    test 'cannot edit article without access token' do
        post '/api/articles/edit',
             params: {title: "can create", desc: "desc", url: "url"}
        assert_response 403
    end

    test 'cannot edit article with wrong access token' do
        post '/api/articles/edit',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'cannot edit article without id' do
        post '/api/articles/edit',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token'}
        assert_response 500
    end

    test 'can edit article' do
        post '/api/articles/edit',
             params: {id: 1,
                      title: "can create",
                      desc: "created",
                      url: "url",
                      date: Date.current.to_s,
                      tags: ['ch', 'en']
             },
             headers: {'AUTHORIZATION': 'access_token'}
        assert_response :success
        article = Article.find(1)
        assert_equal(article.title, 'can create')
        assert_equal(article.desc, 'created')
        assert_equal(['ch', 'en'], article.tags)
        assert_equal(Date.current, article.date)
    end

    test 'cannot delete article if wrong token' do
        post '/api/articles/delete',
             params: {id: 1},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'delete article' do
        article = Article.find(1)
        assert_not_nil(article)
        post '/api/articles/delete',
             params: {id: 1},
             headers: {'AUTHORIZATION': 'access_token'}
        assert_response 200
        article = Article.find_by(id: 1)
        assert_nil(article)
    end

end

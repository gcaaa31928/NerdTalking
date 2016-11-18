require 'test_helper'

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest

    test 'cannot create article if have no access key' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url"}
        assert_response 400
    end

    test 'cannot create article if wrong token' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 400
    end

    test 'create article' do
        post '/api/articles/create',
             params: {title: "can create", desc: "desc", url: "url",
                      tags: ['ch', 'en']},
             headers: {'AUTHORIZATION': 'access_token'}
        p(Article.all.to_json)
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
        assert_response 400
    end

    test 'cannot edit article with wrong access token' do
        post '/api/articles/edit',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 400
    end

    test 'cannot edit article without id' do
        post '/api/articles/edit',
             params: {title: "can create", desc: "desc", url: "url"},
             headers: {'AUTHORIZATION': 'access_token'}
        assert_response 400
    end

    test 'can edit article' do
        post '/api/articles/edit',
             params: {id: 1, title: "can create", desc: "created", url: "url"},
             headers: {'AUTHORIZATION': 'access_token'}
        assert_response :success
        article = Article.find(1)
        assert_equal(article.title, 'can create')
        assert_equal(article.desc, 'created')
    end

end

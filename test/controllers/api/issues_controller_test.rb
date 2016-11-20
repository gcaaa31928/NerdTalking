require 'test_helper'

class Api::IssuesControllerTest < ActionDispatch::IntegrationTest

    test 'cannot create issue if have no access key' do
        post '/api/issues',
             params: {name: "issue", date: Date.current.to_s}
        assert_response 403
    end

    test 'cannot create issue if wrong token' do
        post '/api/issues',
             params: {name: "issue", date: Date.current.to_s},
             headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'create issue' do
        post '/api/issues',
             params: {name: "issue", date: Date.current.to_s},
             headers: {'AUTHORIZATION': 'access_token'}
        issue = Issue.first
        assert_equal("issue", issue.name)
        assert_equal(Date.current, issue.date)
        assert_response :success
    end

    test 'get issues' do
        get '/api/issues'
        assert_response :success
        body = JSON.parse(@response.body)
        issues = body['data']
        assert_equal(issues.length, 2)
        assert_equal(issues[0]['name'], 'name')
    end

    test 'cannot edit issues without access token' do
        patch '/api/issues/1',
              params: {name: "can create"}
        issue = Issue.find(1)
        assert_response 403
    end

    test 'cannot edit issues with wrong access token' do
        patch '/api/issues/1',
              params: {name: "can create"},
              headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'cannot edit issues without id' do
        patch '/api/issues/101',
              params: {name: "can create"},
              headers: {'AUTHORIZATION': 'access_token'}
        assert_response 500
    end

    test 'can edit issues' do
        patch '/api/issues/2',
              params: {name: "can create",
                       date: Date.current.to_s},
              headers: {'AUTHORIZATION': 'access_token'}
        assert_response :success
        issue = Issue.find(2)
        assert_equal(issue.name, "can create")
        assert_equal(issue.date, Date.current)
    end

    test 'cannot delete issue if wrong token' do
        delete '/api/issues/1',
               headers: {'AUTHORIZATION': 'access_token1'}
        assert_response 403
    end

    test 'delete issue' do
        issue = Issue.find(1)
        assert_not_nil(issue)
        delete '/api/issues/1',
               headers: {'AUTHORIZATION': 'access_token'}
        assert_response 200
        issue = Issue.find_by(id: 1)
        assert_nil(issue)
    end

    test 'show issue' do
        get '/api/issues/1'
        body = JSON.parse(@response.body)
        article = body['data']
        expected_article = Issue.find(1)
        assert_equal(article['id'], expected_article.id)
        assert_equal(article['name'], expected_article.name)
        assert_equal(article['date'], expected_article.date.to_s)
    end

end

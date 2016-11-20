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

end

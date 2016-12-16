class Api::IssuesController < ApplicationController
    def create
        valid!
        permitted = params.permit(:name, :date)
        if permitted[:date].nil?
            permitted[:date] = Date.current.to_s
        end
        issue = Issue.new(name: permitted[:name],
                          date: DateTime.parse(permitted[:date]))
        issue.save!
        render HttpStatusCode.ok
    end

    def update
        valid!
        permitted = params.permit(:id, :name, :date)
        if permitted[:date].nil?
            permitted[:date] = Date.current.to_s
        end
        issue = Issue.find_by(id: permitted[:id].to_i)
        issue.update_attributes(name: permitted[:name],
                                date: DateTime.parse(permitted[:date]))
        render HttpStatusCode.ok
    end

    def destroy
        valid!
        permitted = params.permit(:id)
        Issue.destroy(permitted[:id].to_i)
        render HttpStatusCode.ok
    end

    def index
        issues = Issue.all
        render HttpStatusCode.ok(issues.as_json(
            include: {articles: {
                except: [:created_at, :updated_at, :desc]
            }}, except: [:created_at, :updated_at]))
    end

    def show
        permitted = params.permit(:id)
        issue = Issue.find(permitted[:id].to_i)
        render HttpStatusCode.ok(issue.as_json(
            include: {articles: {
                except: [:created_at, :updated_at]
            }}, except: [:created_at, :updated_at]
        ))
    end

    def latest
        issue = Issue.first
        render HttpStatusCode.ok(issue.as_json(
            include: {articles: {
                except: [:created_at, :updated_at]
            }}, except: [:created_at, :updated_at]
        ))
    end


    def valid!
        require_headers
        retrieve_admin
        if @admin.nil?
            raise Errors::ForbiddenError.new('憑證失效', 403)
        end
    end

    def retrieve_admin
        if @access_token.present?
            @admin = Admin.find_by(access_token: @access_token)
        end
    end

    def require_headers
        @access_token = request.headers["AUTHORIZATION"]
    end
end

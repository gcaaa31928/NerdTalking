class Api::ArticlesController < ApplicationController
    def create
        retrieve
        permitted = params.permit(:title, :desc, :url, :date)
        article = Article.new(title: permitted[:title],
                              desc: permitted[:desc],
                              url: permitted[:url],
                              date: permitted[:date])
        article.save!
        render HttpStatusCode.ok
    rescue => e
        render HttpStatusCode.forbidden(
            {
                errorMsg: "#{$!}"
            }
        )
    end

    def edit
        permitted = params.permit(:id, :title, :desc, :url, :date)
        article = Article.find_by(id: permitted[:id].to_i)
        article.update_attributes(title: permitted[:title],
                                  desc: permitted[:desc],
                                  url: permitted[:url],
                                  date: permitted[:date])
        render HttpStatusCode.ok
    rescue => e
        render HttpStatusCode.forbidden(
            {
                errorMsg: "#{$!}"
            }
        )
    end

    def all
        articles = Article.all
        render HttpStatusCode.ok(articles.as_json(except: [:created_at, :updated_at]))
    end


    def retrieve
        require_headers
        retrieve_admin
        if @admin.nil?
            raise '憑證失效'
        end
    end

    def retrieve_admin
        if @access_token.present?
        end
    end

    def require_headers
        @access_token = request.headers["AUTHORIZATION"]
    end
end

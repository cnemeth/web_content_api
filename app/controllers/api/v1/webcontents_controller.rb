module Api
  module V1
    class WebcontentsController < Api::V1::BaseController
      before_action :web_content_fetcher, only: [:create]

      # POST /api/v1/webcontents
      def create
        webcontent = Webcontent.new(permitted_params)
        body = @web_content_fetcher.call.body
        webcontent.content = body

        if webcontent.save
          render json: webcontent, status: :created
        else
          render json: webcontent.errors, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.require(:webcontent).permit(:url, :content)
      end

      def web_content_fetcher
        @web_content_fetcher ||= FetchWebContent.new(url: permitted_params[:url])
      end
    end
  end
end

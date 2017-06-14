module Api
  module V1
    class WebcontentsController < Api::V1::BaseController
      before_action :web_content_fetcher, only: [:create]

      # POST /api/v1/webcontents
      def create
        webcontent = Webcontent.new(permitted_params)
        response = @web_content_fetcher.call
        webcontent.content = response.body
        webcontent.status_code = response.status_code
        webcontent.status_message = response.status_message
        webcontent.headers = response.headers
        webcontent.total_time = response.total_time

        if webcontent.save
          render json: webcontent, status: :created
        else
          render json: webcontent.errors, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        params.require(:webcontent).permit(:url, :content, :status_code, :status_message, :headers, :total_time)
      end

      def web_content_fetcher
        @web_content_fetcher ||= FetchWebContent.new(url: permitted_params[:url])
      end
    end
  end
end

module Api
  module V1
    class WebcontentsController < Api::V1::BaseController

      # POST /api/v1/webcontents
      def create
        webcontent = Webcontent.new(permitted_params)
        #body = FetchWebContent.new(webcontent.url).call.body
        #webcontent.content = body

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
    end
  end
end

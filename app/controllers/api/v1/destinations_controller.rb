module Api
  module V1
    class DestinationsController < ActionController::API
      def index
        render json: Destination.all
      end

      def show
        render json: Destination.find(params[:id])
      end

      def create
        render json: Destination.create(destination_params)
      end

      private
        def destination_params
          params.require(:destination).permit(:name, :zip, :description, :image_url)
        end
    end
  end
end

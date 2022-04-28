class SpicesController < ApplicationController

    def index
        render json: Spice.all
    end

    # def show
    #     render json: find_spice
    # end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end
    
    def destroy
        find_spice.destroy
        head :no_content
    end

    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title,
        :image,
        :description,
        :notes,
        :rating)
    end
end

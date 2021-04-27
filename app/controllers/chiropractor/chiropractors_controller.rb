class Chiropractor::ChiropractorsController < ApplicationController
  def show
    @chiropractor = Chiropractor.find(params[:id])
    if @chiropractor.id != current_chiropractor.id
      redirect_to  chiropractor_chiropractor_path(current_chiropractor)
    end
  end

  def edit
    @chiropractor = Chiropractor.find(params[:id ])
    @treatments = Treatment.all
    if @chiropractor.id != current_chiropractor.id
      redirect_to  chiropractor_chiropractor_path(current_chiropractor)
    end
  end

  def update
    @chiropractor = Chiropractor.find(params[:id ])
    if @chiropractor.update(chiropractor_params)
      redirect_to chiropractor_chiropractor_path(@chiropractor.id)
    else
      @chiropractor = Chiropractor.find(params[:id ])
      render :edit
    end
  end

  private
  def chiropractor_params
    params.require(:chiropractor).permit(:treatment_id, :nickname, :name, :postal_code,:prefecture_code, :address_city, :address_street,
    :phone_number, :email, :image, :fare, :service_charge, :age, :nearest_station, :sex, :treatment_time)
  end
end

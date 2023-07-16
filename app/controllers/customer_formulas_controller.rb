class CustomerFormulasController < ApplicationController
    include Common

    private
  
    def model_params
      params.require(:payload).permit(:formula, :active, :customer_id)
    end    
end

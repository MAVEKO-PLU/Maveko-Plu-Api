class SupplierFormulasController < ApplicationController

    include Common

    private
  
    def model_params
      params.require(:payload).permit(:margin, :label, :active, :supplier_id)
    end    
end

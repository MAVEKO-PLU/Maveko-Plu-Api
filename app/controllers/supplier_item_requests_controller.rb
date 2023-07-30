class SupplierItemRequestsController < ApplicationController
  
  def create
    @sir = SupplierItemRequest.new(model_params)
    if @sir.save
      render json: {sucess: true, data: @sir}
    else
      render json: {sucess: false, data: @sir.errors}
    end
  end

  def show
    @sir = SupplierItemRequest.find_by(supplier_document_id: params[:id])
    render json: {sucess: true, data: @sir}
  end

  def model_params()
    params.require(:payload).permit(:item_code, :item_description, :dimensions, :price_per_pc, :base_unit, :target_unit, :currency, :supplier_document_id, :valid_from, :valid_to, :new_price)
  end
end

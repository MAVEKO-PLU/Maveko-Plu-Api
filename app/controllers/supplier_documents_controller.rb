class SupplierDocumentsController < ApplicationController
    include Common

    def show
        @supplier_document_items = SupplierItemRequest.where(supplier_document_id: params[:id])
        render json: {success: true, data: @supplier_document_items}, status: :ok
    end

    def update
        @doc = SupplierDocument.find(params[:id])
        if @doc.update(model_params)
            if @doc.status == "approved"
                @items = SupplierItemRequest.where(supplier_document_id: params[:id])
                @margin = SupplierFormula.find_by(supplier_id: @doc.supplier_id).margin
                result = []
                @items.each do |item|
                    updated_item = Item.find_by(item_code: item.item_code)
                    puts updated_item.main_item_pricing.pricing.new_purchase_price
                    updated_item.main_item_pricing.pricing.old_retail_price = updated_item.main_item_pricing.pricing.new_retail_price
                    updated_item.main_item_pricing.pricing.old_purchase_price = updated_item.main_item_pricing.pricing.new_purchase_price
                    updated_item.main_item_pricing.pricing.new_purchase_price = item.price_per_pc.to_f
                    updated_item.main_item_pricing.pricing.new_retail_price = item.price_per_pc.to_f + @margin.to_f
                    if updated_item.main_item_pricing.pricing.save
                        result << updated_item
                    end
                end
            end
        end
        render json: {success: true, data: @doc, result: result}
    end


    private

    def model_params
        params.require(:payload).permit(:supplier_id, :reference_no, :effective_date, :status)
    end

end

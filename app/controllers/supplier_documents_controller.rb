class SupplierDocumentsController < ApplicationController
    include Common

    def show
        @supplier_document_items = SupplierItemRequest.where(supplier_document_id: params[:id])
        render json: {success: true, data: @supplier_document_items}, status: :ok
    end

    def create
        @users = User.all()
        @doc = SupplierDocument.new(model_params)
        if @doc.save
            @users.each do |user|
                NotifcationService.new("new", user).call
            end
            render json: {success: true, data: @doc}, status: :ok
        else
            render json: {success: false, data: @doc.errors}, status: :unprocessable_entity
        end
    end
        

    def update
        @users = User.all()
        @doc = SupplierDocument.find(params[:id])
        if @doc.update(model_params) && model_params["status"] == "approved"
            @items = SupplierItemRequest.where(supplier_document_id: params[:id])
            @margin = SupplierFormula.find_by(supplier_id: @doc.supplier_id).margin
            result = @items.map do |item|
                updated_item = Item.find_by(item_code: item.item_code)
                pricing = updated_item.main_item_pricing.pricing
                pricing.old_purchase_price, pricing.old_retail_price =
                    pricing.new_purchase_price, pricing.new_retail_price
                pricing.new_purchase_price, pricing.new_retail_price =
                    item.price_per_pc.to_f, item.price_per_pc.to_f + @margin.to_f    
                pricing.save ? updated_item : nil
            end.compact
            @users.each do |user|
                NotifcationService.new("approve", user).call
            end
        end
        if model_params["status"] == "drafted"
            @users.each do |user|
                NotifcationService.new("update", user).call
            end
        end
        if model_params["status"] == "archived"
            @users.each do |user|
                NotifcationService.new("reject", user).call
            end
        end
        render json: { success: true, data: @doc, result: result }
    end

    private

    def model_params
        params.require(:payload).permit(:supplier_id, :reference_no, :effective_date, :status)
    end

end

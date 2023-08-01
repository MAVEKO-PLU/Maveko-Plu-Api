class ItemsController < ApplicationController
  include Common

  def index
    @data1 = Item.all
    @data2 = Item.where.not(customer_item_pricing_id: !nil)

    render json: {success: true, data: ActiveModelSerializers::SerializableResource.new(@data1), data2: ActiveModelSerializers::SerializableResource.new(@data2)}
  end

  private

  def model_params
    params.require(:payload).permit(:item_code, :decor_code, :item_name, :item_description, :image, :dimension_id,
                                    :article_group, :tax_class, :weight, :base_unit_id, :target_unit_id, :supplier_item_pricing_id, :main_item_pricing_id, :customer_item_pricing_id)
  end
end

module Spree
  module Admin
    module SlidesHelper
      def get_column_header_by_type(type)
        return Spree.t(:name) if type == :image
        return Spree.t(:product) if type == :product

        return '----'
      end

      def get_image_link_by_type(slide, type)
        return link_to(slide.name, object_url(slide)) if type == :image
        return link_to(slide.product.name, object_url(slide)) if type == :product && slide.product

        return '----'
      end

      def product_options_for_select(slide)
        if slide.product_id.present?
          Spree::Product.where(id: slide.product_id).to_a
        else
          []
        end

      end

      def product_url(slug)
        "/products/#{slug}"
      end

    end
  end
end

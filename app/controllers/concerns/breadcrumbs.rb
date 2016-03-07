module Breadcrumbs
  extend ActiveSupport::Concern

  def set_breadcrumbs
    method = "#{params[:action]}_breadcrumb"
    self.send(method) if self.respond_to?(method, true)
  end

  private
    def index_breadcrumb(path=nil)
      add_breadcrumb get_model.model_name.human(count: 2), path
    end

    def new_breadcrumb
      index_breadcrumb(path_to_index)
      add_breadcrumb "Novo registro"
    end

    def create_breadcrumb
      index_breadcrumb(path_to_index)
      add_breadcrumb "Novo registro - Revisão"
    end

    def edit_breadcrumb
      index_breadcrumb(path_to_index)
      add_breadcrumb "Edição de registro"
    end

    def update_breadcrumb
      index_breadcrumb(path_to_index)
      add_breadcrumb "Edição de registro - Revisão"
    end

    def show_breadcrumb
      index_breadcrumb(path_to_index)
      add_breadcrumb "Visualização"
    end

    def get_model
      self.controller_name.classify.constantize
    end

    def path_to_index
      case self.controller_name
      when "bottles"
        user_bottles_path
      else
        send(self.controller_name+"_path")
      end
    end
end

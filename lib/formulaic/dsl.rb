module Formulaic
  module Dsl
    def fill_form(model_name, action = :new, attributes)
      Form.new(model_name, action, attributes).fill
    end

    def fill_form_and_submit(model_name, action = :new, attributes)
      form_action_to_submit_action = { new: :create, edit: :update }
      fill_form(model_name, action, attributes)
      submit_action = form_action_to_submit_action[action] || action
      click_on submit(model_name, submit_action)
    end

    def input(model_name, field, action = :new)
      Label.new(model_name, field, action).to_str
    end

    def submit(model_class, action = :create)
      default = I18n.t([:helpers, :submit, action].join('.'), model: model_class)

      I18n.t([:helpers, :submit, model_class, action].join('.'),
             default: default)
    end
  end
end

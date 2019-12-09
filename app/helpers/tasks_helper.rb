module TasksHelper

  def task_checkbox(task, field)
    content_tag :div, class: "custom-control custom-switch" do
      concat(
          check_box("task[#{field}]", field, checked: task.send(field), class: 'custom-control-input', id: field.to_s) +
          label_tag(field, nil, class: 'custom-control-label', for: field.to_s)
      )
    end
  end

end

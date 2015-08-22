module ApplicationHelper
  def link_to_add(path, text)
    link_to(path, class: 'btn btn-success') do
      content_tag(:i, text, class: 'glyphicon glyphicon-plus')
    end
  end

  def link_to_edit(path, size = :sm)
    link_to(path, class: "btn-#{size} btn-warning", title: 'Editovat') do
      content_tag(:i, nil, class: 'glyphicon glyphicon-pencil')
    end
  end

  def link_to_show(path, size = :sm)
    link_to(path, class: "btn-#{size} btn-primary", title: 'Zobrazit detail') do
      content_tag(:i, nil, class: 'glyphicon glyphicon-search')
    end
  end

  def link_to_destroy(path, size = :sm)
    link_to path,
            method: :delete,
            class: "btn-#{size} btn-danger",
            title: 'Odstranit',
            data: {confirm: 'Určitě? Tato změna je nevratná.'} do

      content_tag(:i, nil, class: 'glyphicon glyphicon-trash')
    end
  end
end

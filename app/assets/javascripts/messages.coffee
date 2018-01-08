jQuery(document).on 'turbolinks:load', ->
  $('#to').select2
    ajax: {
      url: '/users'
      data: (params) ->
        {
          term: params.term
        }
      dataType: 'json'
      delay: 500
      processResults: (data, params) ->
        {
          results: _.map(data, (el) ->
            {
              id: el.id
              name: "#{el.content}, #{el.title}"
            }
          )
        }
      cache: true
    }
    escapeMarkup: (markup) -> markup
    minimumInputLength: 2
    templateResult: (item) -> item.title
    templateSelection: (item) -> item.title

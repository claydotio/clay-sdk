module.exports =
  queryPath: (path, queryParams) ->
    query = '?'
    for key, val of queryParams
      query += key + '=' + encodeURIComponent(val) + '&'

    return path + query

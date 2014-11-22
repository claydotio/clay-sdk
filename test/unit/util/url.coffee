should = require('clay-chai').should()

url = require 'util/url'


describe 'Util | Url', ->
  it 'joins path params', ->
    url.queryPath 'abc', {
      ab: 'bc'
      c: 'd'
      e: 'f'
      g: '?'
      h: 'a&b'
      i: 'z=z'
    }
    .should.be 'abc?ab=bc&c=d&e=f&g=%3F&h=a%26b&i=z%3Dz&'

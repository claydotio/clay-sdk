should = require('clay-chai').should()

url = require 'util/url'


describe 'Util | Url', ->
  it 'joins path params', ->
    url.queryPath('abc', {a: 'b', c: 'd', e: 'f'}).should.be 'abc?a=b&c=d&e=f&'

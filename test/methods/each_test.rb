require_relative '../test_helper'

describe Scribble::Methods::Each do
  it 'iterates over any enumerable' do
    assert_scribble_render "{{ foobars.each 'item' }}{{item}} {{ end }}", "", variables: { foobars: [] }
    assert_scribble_render "{{ foobars.each 'item' }}{{item}} {{ end }}", "Foo ", variables: { foobars: ["Foo"]}
    assert_scribble_render "{{ foobars.each 'item' }}{{item}} {{ end }}", "Foo Bar ", variables: { foobars: ["Foo", "Bar"]}
    assert_scribble_render "{{ foobars.each 'item' }}{{item}} {{ end }}", "Foo Bar Baz ", variables: { foobars: ["Foo", "Bar", "Baz"]}
  end
end

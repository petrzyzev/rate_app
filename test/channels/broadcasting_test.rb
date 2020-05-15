# frozen_string_literal: true

class CableTest < ActionCable::TestCase
  def test_broadcasts
    assert_broadcasts('fetch', 1) do
      ActionCable.server.broadcast 'fetch', { rate: '12.24' }
    end

    assert_no_broadcasts('fetch') do
      ActionCable.server.broadcast 'wrong', { rate: '12.24' }
    end
  end
end

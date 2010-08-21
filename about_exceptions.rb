require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutExceptions < EdgeCase::Koan

  class MySpecialError < RuntimeError
  end

  def test_exceptions_inherit_from_Exception
    assert_equal __, MySpecialError.ancestors[1]
    assert_equal __, MySpecialError.ancestors[2]
    assert_equal __, MySpecialError.ancestors[3]
    assert_equal __, MySpecialError.ancestors[4]
  end

  def test_rescue_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    assert_equal __, result

    assert ex.is_a?(StandardError), "Failure message."
    assert ex.is_a?(RuntimeError), "Failure message."

    assert RuntimeError.ancestors.include?(StandardError),
      "RuntimeError is a subclass of StandardError"
    
    assert_equal __, ex.message
  end

  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    assert_equal __, result
    assert_equal __, ex.message
  end

  def test_ensure_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      # no code here
    ensure
      result = :always_run
    end

    assert_equal __, result
  end

end
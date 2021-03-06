require 'logger'

class Framework::Logger < Logger

  # @param [String] message
  def disappointment(message)
    info("\e[#{32}mFramework\e[1m \e[#{31}m#{message}\e[0m")
  end

  # @param [String] message
  def hint(message)
    info("\e[#{32}mFramework\e[1m \e[#{33}m#{message}\e[0m")
  end

  # @param [String] message
  def note(message)
    info("\e[#{32}mFramework\e[0m \e[#{33}m#{message}\e[0m")
  end

  # @param [String] message
  def whisper(message)
    info("\e[#{32}mFramework\e[0m \e[#{37}m#{message}\e[0m")
  end

  # @param [String] message
  def self.disappointment(message)
    internal.disappointment(message)
  end

  # @param [String] message
  def self.hint(message)
    internal.hint(message)
  end

  # @param [String] message
  def self.note(message)
    internal.note(message)
  end

  # @param [String] message
  def self.whisper(message)
    internal.whisper(message)
  end

  # Returns application logger
  # @return [Framework::Logger]
  def self.internal
    Framework.app.try(:logger) || @internal ||= self.new(STDOUT)
  end
end

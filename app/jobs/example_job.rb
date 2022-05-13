# frozen_string_literal: true

class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    sleep 5
    # Will display current time, milliseconds included
    p "hi, this is just testing message #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end
end

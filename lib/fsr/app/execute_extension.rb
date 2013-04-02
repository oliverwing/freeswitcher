require "fsr/app"
module FSR
  module App
    class Execute_Extension < Application
      attr_reader :destination_number, :dialplan, :context

      def initialize(destination_number, dialplan = nil, context = nil)
        @destination_number = destination_number
        @dialplan = dialplan
        @context = context
      end

      def arguments
        [@destination_number, @dialplan, @context]
      end

      def sendmsg
        "call-command: execute\nexecute-app-name: %s\nexecute-app-arg: %s\nevent-lock:true\n\n" % [app_name, arguments.join(" ")]
      end
    end

    register(:execute_extension, Execute_Extension)
  end
end

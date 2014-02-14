# -*- encoding: utf-8 -*-
require 'qiniu-kit'

module Qiniu
  module Policy
    class Put

      attr_reader :mac, :args

      def initialize(mac_object = nil, &block)
        if mac_object.nil?
          @mac = Qiniu::Kit::Mac.new
        else
          unless mac_object.instance_of?(Qiniu::Kit::Mac)
            raise Qiniu::Errors::NotAnInstanceOfError.new("Invalid mac object")
          end
          @mac = mac_object
        end
        @args ||= {}
        instance_eval(&block) if block_given?
      end

      def method_missing(sym, *args, &block)
        method_id = sym.to_s
        if method_id.end_with?('=')
          @args[method_id.chomp('=').to_sym] = args[0]
        end
      end

      def token
        @mac.sign_with_data(Qiniu::Kit.encode_json(@args))
      end

    end
  end
end

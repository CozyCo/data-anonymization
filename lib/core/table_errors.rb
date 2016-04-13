module DataAnon
  module Core

    class TableErrors
      include Utils::Logging

      def initialize table_name
        @table_name = table_name
        @errors = []
      end

      def log_error record, exception
        @errors << { :record => record, :exception => exception}
        logger.error(exception)
        logger.debug(exception.backtrace.unshift('Backtrace:').join("\n\t"))
        raise "Reached limit of error for a table" if @errors.length > 100
      end

      def errors
        @errors
      end

      def print_summary
        return if @errors.length == 0
        logger.error("Errors while processing table '#{@table_name}': #{@errors.length}")
      end

    end

  end
end
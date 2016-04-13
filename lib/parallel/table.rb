require 'parallel'

module DataAnon
  module Parallel
    class Table

      def anonymize tables
        ::Parallel.each(tables) do |table|
          begin
            table.progress_bar_class DataAnon::Utils::ParallelProgressBar
            table.process
          rescue => e
            logger.error(e.message)
            logger.debug(e.backtrace.unshift('Backtrace:').join("\n\t"))
          end
        end
      end

    end
  end
end
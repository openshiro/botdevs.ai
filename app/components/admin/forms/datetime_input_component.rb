module Admin
  module Forms
    class DatetimeInputComponent < BaseComponent
      private attr_reader :options, :include_blank

      def initialize(form, field, classes:)
        super(form, field, classes:)
      end

      def call
        form.datetime_field(field, class: classes)
      end
    end
  end
end

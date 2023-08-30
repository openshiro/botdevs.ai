module Pricing
  class Stats
    def developers
      return 0 unless visible_developers.positive?

      SignificantFigure.new(visible_developers).rounded
    end

    def response_rate
      return 1 unless conversations.positive?

      responded_to_conversations.fdiv(conversations)
    end

    def new_devs
      return 0 unless devs_per_month.positive?

      SignificantFigure.new(devs_per_month).rounded
    end

    private

    def visible_developers
      Developer.visible.count
    end

    def responded_to_conversations
      Message.where(sender_type: Developer.name).distinct.count(:conversation_id)
    end

    def conversations
      Conversation.count
    end

    def devs_per_month
      devs_per_month = Developer.group("DATE_TRUNC('month', created_at)").count.values
      devs_per_month.sum.fdiv(devs_per_month.count)
    end
  end
end

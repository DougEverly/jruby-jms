# Workaround for IBM MQ JMS implementation that implements some undocumented methods

begin
  
  class com.ibm.mq.jms::MQQueueSession    
    def consume(params, &proc)
      Java::JavaxJms::Session.instance_method(:consume).bind(self).call(params, &proc)
    end
  end

  class com.ibm.mq.jms::MQQueueReceiver
    def each(params, &proc)
      Java::JavaxJms::MessageConsumer.instance_method(:each).bind(self).call(params, &proc)
    end
    def get(params={})
      Java::JavaxJms::MessageConsumer.instance_method(:get).bind(self).call(params)
    end
  end

rescue NameError
  # Ignore errors (when we aren't using MQ)
end
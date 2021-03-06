################################################################################
#  Copyright 2008, 2009, 2010, 2011  J. Reid Morrison
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
################################################################################

module JMS
  # Full Qualified name causes a Java exception
  java_import 'oracle.jms.AQjmsFactory'

  # Connection Factory to support Oracle AQ
  class OracleAQConnectionFactory
    attr_accessor :username, :url
    #attr_writer :password
    attr_accessor :password

    # Creates a connection per standard JMS 1.1 techniques from the Oracle AQ JMS Interface
    def create_connection(*args)
    # Since username and password are not assigned (see lib/jms/connection.rb:200)
    # and connection_factory.create_connection expects 2 arguments when username is not null ...
      if args.length == 2
        @username = args[0]
        @password = args[1]
      end

     # Full Qualified name causes a Java exception
      #cf = oracle.jms.AQjmsFactory.getConnectionFactory(@url, java.util.Properties.new)
      cf = AQjmsFactory.getConnectionFactory(@url, java.util.Properties.new)

      if username
        cf.createConnection(@username, @password)
      else
        cf.createConnection()
      end
    end
  end

end

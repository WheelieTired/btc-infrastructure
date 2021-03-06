# btc_infrastructure -- Cookbook for the Bicycle Touring Companion
# Copyright (C) 2016 Adventure Cycling Association
#
# This file is part of btc_infrastructure.
#
# btc_infrastructure is free software: you can redistribute it and/or modify
# it under the terms of the Affero GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# btc_infrastructure is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# Affero GNU General Public License for more details.
#
# You should have received a copy of the Affero GNU General Public License
# along with btc_infrastructure.  If not, see <http://www.gnu.org/licenses/>.

require 'serverspec'

set :backend, :cmd
set :os, family: 'windows'

describe 'CouchDB Server' do
  describe service('Apache CouchDB') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(5984) do
    it { should be_listening.with('tcp') }
  end

  describe file('C:\CouchDB\etc\couchdb\local.ini') do
    it { should be_file }
  end
end

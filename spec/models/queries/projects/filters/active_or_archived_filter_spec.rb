#-- encoding: UTF-8

#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe Queries::Projects::Filters::ActiveOrArchivedFilter, type: :model do
  it_behaves_like 'list_all query filter' do
    let(:values) { ['A name'] }
    let(:model) { Project }
    let(:class_key) { :status }
    let(:type) { :list_all }
    let(:attribute) { :status }
    let(:valid_values) { [Project::STATUS_ACTIVE.to_s, Project::STATUS_ARCHIVED.to_s] }

    describe '#allowed_values' do
      it 'to be either active or archived' do
        expect(instance.allowed_values.map(&:second)).to eq valid_values
      end
    end
  end
end

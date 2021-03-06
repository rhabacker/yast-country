# encoding: utf-8

# ------------------------------------------------------------------------------
# Copyright (c) 2012 Novell, Inc. All Rights Reserved.
#
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of version 2 of the GNU General Public License as published by the
# Free Software Foundation.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, contact Novell, Inc.
#
# To contact Novell about this file by physical or electronic mail, you may find
# current contact information at www.novell.com.
# ------------------------------------------------------------------------------
# File:		language_simple_proposal.ycp
# Author:		Jiri Suchomel <jsuchome@suse.cz>
# Purpose:		Simple language proposal.
#
# $Id$
module Yast
  class LanguageSimpleProposalClient < Client
    def main
      Yast.import "Language"

      @func = Convert.to_string(WFM.Args(0))
      @param = Convert.to_map(WFM.Args(1))
      @ret = {}

      if @func == "MakeProposal"
        @ret = {
          "preformatted_proposal" => Language.MakeSimpleProposal,
          "language_changed"      => false
        }
      else
        @ret = Convert.to_map(
          WFM.CallFunction("language_proposal", [@func, @param])
        )
      end
      deep_copy(@ret)
    end
  end
end

Yast::LanguageSimpleProposalClient.new.main

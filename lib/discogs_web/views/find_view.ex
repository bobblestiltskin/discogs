defmodule DiscogsWeb.FindView do
  @moduledoc """
  This module provides the link generation function for the find view page.
  """

  use DiscogsWeb, :view

  def display_option(artist) do
    "<option value=\"#{Integer.to_string(artist.id)}\">#{artist.artist}</option>"
  end
end

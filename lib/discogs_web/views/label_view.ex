defmodule DiscogsWeb.LabelView do
  @moduledoc """
  This module provides the link generation view function for the labels page.
  """

  use DiscogsWeb, :view

  def discogs_link(label_name) do
    x = label_name |> String.replace(" ", "+")
    "https://www.discogs.com/search/?type=label&title=#{x}"
  end

end

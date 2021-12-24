defmodule DiscogsWeb.LabelView do
  use DiscogsWeb, :view

#  alias Discogs.Search

#  def name(%Search.Label{label: label}) do
#    label
#  end

  def discogs_link(label_name) do
    x = label_name |> String.replace(" ", "+")
    "https://www.discogs.com/search/?type=label&title=#{x}"
  end

end

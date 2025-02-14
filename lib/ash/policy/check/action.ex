defmodule Ash.Policy.Check.Action do
  @moduledoc false
  use Ash.Policy.SimpleCheck

  @impl true
  def describe(options) do
    operator =
      if is_list(options[:action]) do
        "in"
      else
        "=="
      end

    "action #{operator} #{inspect(options[:action])}"
  end

  @impl true
  def match?(_actor, %{action: %{name: name}}, options) do
    name in List.wrap(options[:action])
  end
end

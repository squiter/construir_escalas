defmodule ConstruirEscala.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    # For a CLI tool, we don't need a supervision tree
    # We'll just run the CLI and exit
    args = System.argv()
    ConstruirEscala.CLI.main(args)
    System.halt(0)
  end
end

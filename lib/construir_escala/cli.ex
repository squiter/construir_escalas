defmodule ConstruirEscala.CLI do
  @moduledoc """
  Interface de linha de comando para o ConstruirEscala.
  """

  def main(args) do
    # Filter out empty strings and maintenance commands
    args = args
           |> Enum.reject(&(&1 == ""))
           |> Enum.reject(&String.starts_with?(&1, "maintenance"))
    
    case args do
      [date_str] ->
        with {:ok, date} <- Date.from_iso8601(date_str) do
          ConstruirEscala.print(date)
        else
          _ ->
            IO.puts("❌ Data inválida. Use o formato YYYY-MM-DD")
            System.halt(1)
        end

      [date_str, weeks_str] ->
        with {:ok, date} <- Date.from_iso8601(date_str),
             {weeks, ""} <- Integer.parse(weeks_str),
             true <- weeks > 0 do
          ConstruirEscala.print(date, weeks)
        else
          _ ->
            print_usage()
            System.halt(1)
        end

      _ ->
        print_usage()
        System.halt(1)
    end
  end

  defp print_usage do
    IO.puts("❌ Uso correto:")
    IO.puts("   construir_escala YYYY-MM-DD [semanas]")
    IO.puts("   Ex: construir_escala 2026-01-06 52")
  end
end

defmodule ConstruirEscala.MixProject do
  use Mix.Project

  def project do
    [
      app: :construir_escala,
      version: "1.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      burrito: burrito(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ConstruirEscala.Application, []}
    ]
  end

  defp deps do
    [
      {:burrito, "~> 1.5", runtime: false}
    ]
  end

  defp escript do
    [
      main_module: ConstruirEscala.CLI,
      name: "construir_escala"
    ]
  end

  defp burrito do
    [
      targets: [
        windows: [os: :windows, cpu: :x86_64]
      ]
    ]
  end

  defp releases do
    [
      construir_escala: [
        steps: [:assemble, &Burrito.wrap/1]
      ]
    ]
  end
end

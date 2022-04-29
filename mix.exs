defmodule Change.MixProject do
    use Mix.Project
    
    def project do
        [
          app: :elixir_change,
          version: "0.1.0",
          start_permanent: Mix.env() == :prod
        ]
    end
    
    # Run App
    def application do
        [
          extra_applications: [:logger]
        ]
    end
  
end
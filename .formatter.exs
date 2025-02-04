[
  import_deps: [:absinthe, :ecto, :ecto_sql, :phoenix],
  subdirectories: ["priv/*/migrations"],
  plugins: [TailwindFormatter.MultiFormatter, Ambry.GraphQLSigilFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"],
  heex_line_length: 120
]

defmodule Ambry.Media.Processor.OpusConcat do
  @moduledoc """
  A media processor that concatenates a collection of Opus files and then
  converts them to dash & hls streaming format.
  """

  import Ambry.Media.Processor.Shared

  alias Ambry.Media.Media

  @extensions ~w(.opus)

  def name do
    "Opus Concat"
  end

  def can_run?({media, filenames}) do
    can_run?(Media.files(media, @extensions) ++ filenames)
  end

  def can_run?(%Media{} = media) do
    media |> Media.files(@extensions) |> can_run?()
  end

  def can_run?(filenames) when is_list(filenames) do
    filenames |> filter_filenames(@extensions) |> length() > 1
  end

  def run(media) do
    id = concat_files!(media, @extensions)
    create_stream!(media, id)
    finalize!(media, id)
  end
end

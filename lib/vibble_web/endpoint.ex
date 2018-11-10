defmodule VibbleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :vibble

  socket "/socket", VibbleWeb.UserSocket,
    websocket: true,
    longpoll: false


  # Setup endpoint to allow serving of react app from priv/frontend/build
  plug Plug.Static.IndexHtml,
    at: "/"

  plug Plug.Static,
    at: "/",
    from: "priv/frontend/build/",
    gzip: false,
    only: ~w(index.html favicon.ico static)


  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_vibble_key",
    signing_salt: "2sbl3RP/"

  plug VibbleWeb.Router
end

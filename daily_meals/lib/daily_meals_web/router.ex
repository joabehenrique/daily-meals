defmodule DailyMealsWeb.Router do
  use DailyMealsWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api/v1", DailyMealsWeb do
    pipe_through(:api)

    get("/meals", MealsController, :find_all)
    get("/meals/:id", MealsController, :find_by_id)
    post("/meals", MealsController, :create)
    put("/meals/:id", MealsController, :update)
    delete("/meals/:id", MealsController, :delete)
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through([:fetch_session, :protect_from_forgery])
      live_dashboard("/dashboard", metrics: DailyMealsWeb.Telemetry)
    end
  end
end

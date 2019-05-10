script.on_nth_tick(3600, function(event)
  local elapsed = event.tick / 3600
  local timeout = settings.global["timed-peace-minutes"].value
  local player = game.get_player(1)
  local nauvis = game.surfaces.nauvis


  if elapsed >= timeout then
    -- Disable peace
    player.print("Peace timeout reached. Disabling peace.")
    nauvis.peaceful_mode = false

    -- Unregister handler
    player.print("Disabling tick handler.")
    script.on_nth_tick(3600, nil)
  else
    player.print("Peace timeout not reached yet.")
  end
end)

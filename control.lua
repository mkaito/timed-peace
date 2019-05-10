function printAll(text, bool)
  if (debug or bool) then
    local text2 = ""
    if type(text) == "table" then text2 = serpent.block(text, {comment=false})
      for i in pairs (game.players) do
        game.players[i].print(text2)
      end
    else
      for i in pairs (game.players) do
        game.players[i].print(text)
      end
    end
  end
end

script.on_nth_tick(3600, function(event)
  local elapsed = event.tick / 3600
  local timeout = settings.global["timed-peace-minutes"].value
  local nauvis = game.surfaces.nauvis


  if elapsed >= timeout then
    -- Disable peace
    printAll("Peace timeout reached. Disabling peace.")
    nauvis.peaceful_mode = false

    -- Unregister handler
    script.on_nth_tick(3600, nil)
  end
end)

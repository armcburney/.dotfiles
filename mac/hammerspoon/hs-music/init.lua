--------------------------------------------------------------------------------
-- hs-music
--
-- Pause and play for iTunes
-- @author: zzamboni, Andrew McBurney
--------------------------------------------------------------------------------

logger = hs.logger.new('main')

local music_playing = false

function audiowatch(arg)
  logger.df("Audiowatch arg: %s", arg)
end

hs.audiodevice.watcher.setCallback(audiowatch)
hs.audiodevice.watcher.start()

function notify(title, text)
  hs.notify.new({title=title, informativeText=text}):send()
end

function pause_music()
  logger.df("Pausing iTunes.")
  hs.itunes.pause()
end

function play_music()
  logger.df("Playing iTunes.")
  hs.itunes.play()
end

function audiodevwatch(dev_uid, event_name, event_scope, event_element)
  logger.df("Audiodevwatch args: %s, %s, %s, %s", dev_uid, event_name,
            event_scope, event_element)
  dev = hs.audiodevice.findDeviceByUID(dev_uid)

  if event_name == 'jack' then
    if dev:jackConnected() then
      if music_playing then
        play_music()
        notify("Headphones plugged in", "Resume playing music.")
      end
    elseif hs.itunes.isPlaying() then
      pause_music()
      notify("Headphones unplugged", "Pausing music.")
      music_playing = true
    end
  end
end

for i, dev in ipairs(hs.audiodevice.allOutputDevices()) do
  dev:watcherCallback(audiodevwatch):watcherStart()
  logger.df("Setting up watcher for audio device %s", dev:name())
end

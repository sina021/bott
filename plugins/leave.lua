do
-- Will leave the group if be added
local function run(msg, matches)
local bot_id = 112274576 -- your bot id
   -- like local bot_id = 1234567
    if matches[1] == 'leave' and is_admin(msg) then
       chat_del_user("channel#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
    elseif msg.action.type == "chat_add_user" and msg.action.user.id == tonumber(bot_id) and not is_sudo(msg) then
      send_large_msg("channel#id"..msg.to.id, 'ابن this is not of my groups.', ok_cb, false)
      chat_del_user("channel#id"..msg.to.id, 'user#id'..bot_id, ok_cb, false)
      block_user("user#id"..msg.from.id,ok_cb,false)
    end
end
 
return {
  patterns = {
    "^[!/](leave)$",
    "^!!tgservice (.+)$",
  },
  run = run
}
end

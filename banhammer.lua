local function pre_process(msg)
chat = msg.chat_id_
user = msg.sender_user_id_
	local function check_newmember(arg, data)
		test = load_data(_config.moderation.data)
		lock_bots = test[arg.chat_id]['settings']['lock_bots']
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    if data.type_.ID == "UserTypeBot" then
      if not is_owner(arg.msg) and lock_bots == 'yes' then
kick_user(data.id_, arg.chat_id)
end
end
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if is_banned(data.id_, arg.chat_id) then
   if not lang then
	 tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is banned_", 0, "md")
   else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _Êã ÍÙÑå ãä ÇáãÌãæÚÉ??_", 0, "md")
end
kick_user(data.id_, arg.chat_id)
end
if is_gbanned(data.id_) then
     if not lang then
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is globally banned_", 0, "md")
    else
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _Êã ÍÙÑå ãä ãÌãæÚÇÊ ÇáÈæÊ??_", 0, "md")
   end
kick_user(data.id_, arg.chat_id)
     end
	end
	if msg.adduser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
	if msg.joinuser then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, check_newmember, {chat_id=chat,msg_id=msg.id_,user_id=user,msg=msg})
	end
if is_silent_user(user, chat) then
del_msg(msg.chat_id_, msg.id_)
end
if is_banned(user, chat) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
if is_gbanned(user) then
del_msg(msg.chat_id_, tonumber(msg.id_))
    kick_user(user, chat)
   end
end
local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
  local cmd = arg.cmd
if not tonumber(data.sender_user_id_) then return false end
if data.sender_user_id_ then
  if cmd == "ÍÙÑ" then
local function ban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't ban_ *mods,owners and bot admins*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÍÙÑ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ Öãä ÇáãÍÙæÑíä ÈÇáİÚá??*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n_has been_ *banned*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ÍÙÑå ãä ÇáãÌãæÚÉ??*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
   if cmd == "ÇáÛÇÁ ÇáÍÙÑ" then
local function unban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *banned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÓ Öãä ÇáãÍÙæÑíä ÈÇáİÚá??*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *unbanned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáÍÙÑ Úäå??*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "ÇßÊã" then
local function silent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÇÓßÇÊ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *silent*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ßÊã ÇáÚÖæ??*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _added to_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ßÊã ÇáÚÖæ????*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, silent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "İÊÍ ÇáßÊã" then
local function unsilent_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *silent*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÓ Öãä ÇáãßÊæãíä ÈÇáİÚá??*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _removed from_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáßÊã Úäå????*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, unsilent_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "ÍÙÑ ÚÇã" then
local function gban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't_ *globally ban* _other admins_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÍÙÑ ÇáÇÏãäíÉ ãä ãÌãæÚÇÊ ÇáÈæÊ*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *globally banned*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã ÈÇáİÚá??*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ÍÙÑå ãä ãÌãæÚÇÊ ÇáÈæÊ??*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, gban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "İÊÍ ÚÇã" then
local function ungban_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÓ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã??*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáÍÙÑ ÇáÚÇã Úäå??*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, ungban_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
  if cmd == "ÇØÑÏ" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*áÇ íãßäß ØÑÏ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
   end
  else
     kick_user(data.sender_user_id_, data.chat_id_)
     end
  end
  if cmd == "ÇãÓÍ Çáßá" then
   if is_mod1(data.chat_id_, data.sender_user_id_) then
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_You can't delete messages_ *mods,owners and bot admins*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*áÇ íãßäß ÍĞİ ÌãíÚ ÑÓÇÆá ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_All_ *messages* _of_ *[ "..data.sender_user_id_.." ]* _has been_ *deleted*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "*ÑÓÇÆá ÇáãÓÊÎÏã* *[ "..data.sender_user_id_.." ]*\n *Êã ÍĞİåÇ*", 0, "md")
       end
    end
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "_áã íÊã ÇáÚËæÑ Úáì ÇáãÓÊÎÏã_", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User Not Found*", 0, "md")
      end
   end
end
local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not arg.username then return false end
    if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
  if cmd == "ÍÙÑ" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't ban_ *mods,owners and bot admins*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÍÙÑ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
         end
     end
if administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ Öãä ÇáãÍÙæÑíä ÈÇáİÚá??*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *banned*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ÍÙÑ ÇáÚÖæ??*", 0, "md")
   end
end
   if cmd == "ÇáÛÇÁ ÇáÍÙÑ" then
if not administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *banned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÔ Öãä ÇáãÍÙæÑíä ÈÇáİÚá??*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['banned'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *unbanned*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáÍÙÑ Úäå??*", 0, "md")
   end
end
  if cmd == "ÇßÊã" then
   if is_mod1(arg.chat_id, data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't silent_ *mods,owners and bot admins*", 0, "md")
    else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÇÓßÇÊ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
       end
     end
if administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *silent*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ ÈÇáİÚá Öãä ÇáãßÊæãíä??*", 0, "md")
     end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
  if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _added to_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ßÊã ÇáÚÖæ??*", 0, "md")
   end
end
  if cmd == "İÊÍ ÇáßÊã" then
if not administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *silent*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÓ ÇáãßÊæãíä ÈÇáİÚá????*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['is_silent_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _removed from_ *silent users list*", 0, "md")
  else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáßÊã Úäå??*", 0, "md")
   end
end
  if cmd == "ÍÙÑ ÚÇã" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
   if is_admin1(data.id_) then
  if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't_ *globally ban* _other admins_", 0, "md")
  else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÍÙÑ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
        end
     end
if is_gbanned(data.id_) then
   if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is already_ *globally banned*", 0, "md")
    else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã ÈÇáİÚá??*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   kick_user(data.id_, arg.chat_id)
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã ÍÙÑå ãä ãÌãæÚÇÊ ÇáÈæÊ??*", 0, "md")
   end
end
  if cmd == "İÊÍ ÚÇã" then
  if not administration['gban_users'] then
    administration['gban_users'] = {}
    save_data(_config.moderation.data, administration)
    end
if not is_gbanned(data.id_) then
     if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _is not_ *globally banned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *åæ áíÓ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã??*", 0, "md")
      end
   end
  administration['gban_users'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
    if not lang then
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n _has been_ *globally unbanned*", 0, "md")
   else
     return tdcli.sendMessage(arg.chat_id, "", 0, "* ???| User :* "..user_name.."\n *???| ID : "..data.id_.."*\n *Êã İÊÍ ÇáÍÙÑ ÇáÚÇã Úäå????*", 0, "md")
   end
end
  if cmd == "ÇØÑÏ" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't kick_ *mods,owners and bot admins*", 0, "md")
    elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ØÑÏ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
   end
  else
     kick_user(data.id_, arg.chat_id)
     end
  end
  if cmd == "ÇãÓÍ Çáßá" then
   if is_mod1(arg.chat_id, data.id_) then
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_You can't delete messages_ *mods,owners and bot admins*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*áÇ íãßäß ÍĞİ ÑÓÇÆá ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
   end
  else
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_All_ *messages* _of_ "..user_name.." *[ "..data.id_.." ]* _has been_ *deleted*", 0, "md")
      elseif lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "*ÍãíÚ ÑÓÇÆá ÇáãÓÊÎÏã* "..user_name.." *[ "..data.id_.." ]* *Êã ÍĞİåÇ*", 0, "md")
       end
    end
  end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_áã íÊã ÇáÚËæÑ Úáì ÇáãÓÊÎÏã_", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User Not Found*", 0, "md")
      end
   end
end
local function run(msg, matches)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
chat = msg.chat_id_
user = msg.sender_user_id_
 if matches[1] == "ÇØÑÏ" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÇØÑÏ"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   if not lang then
     tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't kick mods,owners or bot admins_", 0, "md")
   elseif lang then
     tdcli.sendMessage(msg.chat_id_, "", 0, "*áÇ íãßäß ØÑÏ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
         end
     else
kick_user(matches[2], msg.chat_id_)
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÇØÑÏ"})
         end
      end
 if matches[1] == "ÇãÓÍ Çáßá" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÇãÓÍ Çáßá"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't delete messages mods,owners or bot admins_", 0, "md")
     elseif lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*áÇ íãßäß ÍĞİ ÌãíÚ ÇáÑÓÇÆá ááãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
   end
     else
tdcli.deleteMessagesFromUser(msg.chat_id_, matches[2], dl_cb, nil)
    if not lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "_All_ *messages* _of_ *[ "..matches[2].." ]* _has been_ *deleted*", 0, "md")
   elseif lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*ÌãíÚ ÑÓÇÆá ÇáãÓÊÎÏã* *[ "..matches[2].." ]* *Êã ÍĞİåÇ*", 0, "md")
         end
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÇãÓÍ Çáßá"})
         end
      end
 if matches[1] == "ÍÙÑ ÚÇã" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÍÙÑ ÚÇã"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_admin1(matches[2]) then
   if not lang then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't globally ban other admins_", 0, "md")
else
    return tdcli.sendMessage(msg.chat_id_, "", 0, "*áÇ íãßäß ÍÙÑ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
        end
     end
   if is_gbanned(matches[2]) then
   if not lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is already globally banned*", 0, "md")
    else
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* åæ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã ÈÇáİÚá?? *", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*has been globally banned*", 0, "md")
    else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*Êã ÍÙÑå ãä ãÌãæÚÇÊ ÇáÈæÊ????*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÍÙÑ ÚÇã"})
      end
   end
 if matches[1] == "İÊÍ ÚÇã" and is_admin(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="İÊÍ ÚÇã"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_gbanned(matches[2]) then
     if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is not globally banned*", 0, "md")
    else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."*åæ áíÓ Öãä ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã??*", 0, "md")
        end
     end
  data['gban_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* has been globally unbanned*", 0, "md")
   else
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*Êã İÊÍ ÇáÍÙÑ ÇáÚÇã Úäå??*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="İÊÍ ÚÇã"})
      end
   end
 if matches[1] == "ÍÙÑ" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÍÙÑ"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
     if not lang then
    return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't ban mods,owners or bot admins_", 0, "md")
    else
    return tdcli.sendMessage(msg.chat_id_, "", 0, "*áÇ íãßäß ÍÙÑ ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
        end
     end
   if is_banned(matches[2], msg.chat_id_) then
   if not lang then
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is already banned_", 0, "md")
  else
  return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user "..matches[2].."*åæ Öãä ÇáãÍÙæÑíä ÈÇáİÚá??*", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
kick_user(matches[2], msg.chat_id_)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* has been banned_", 0, "md")
  else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*Êã ÍÙÑ ÇáÚÖæ ãä ÇáãÌãæÚÉ????*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
     tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÍÙÑ"})
      end
   end
 if matches[1] == "ÇáÛÇÁ ÇáÍÙÑ" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÇáÛÇÁ ÇáÍÙÑ"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_banned(matches[2], msg.chat_id_) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is not banned_", 0, "md")
  else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* åæ áíÓ Öãä ŞÇÆãÉ ÇáãÍÖæÑíä?? *", 0, "md")
        end
     end
data[tostring(chat)]['banned'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* has been unbanned_", 0, "md")
   else
return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*Êã İÊÍ ÇáÍÙÑ Úäå????*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÇáÛÇÁ ÇáÍÙÑ"})
      end
   end
 if matches[1] == "ÇßÊã" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="ÇßÊã"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if is_mod1(msg.chat_id_, matches[2]) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "_You can't silent mods,leaders or bot admins_", 0, "md")
 else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*áÇ íãßäß ßÊã ÇáãÔÑİíä æÇáÇÏãäíÉ*", 0, "md")
        end
     end
   if is_silent_user(matches[2], chat) then
   if not lang then
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is already silent_", 0, "md")
   else
   return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."*åæ Öãä ÇáãßÊæãíä ÈÇáİÚá????*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = ""
    save_data(_config.moderation.data, data)
    if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* added to silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."*Êã ßÊã ÇáÚÖæ??*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="ÇßÊã"})
      end
   end
 if matches[1] == "İÊÍ ÇáßÊã" and is_mod(msg) then
if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.chat_id_,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.chat_id_,cmd="İÊÍ ÇáßÊã"})
end
  if matches[2] and string.match(matches[2], '^%d+$') then
   if not is_silent_user(matches[2], chat) then
     if not lang then
     return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."* is not silent_", 0, "md")
   else
     return tdcli.sendMessage(msg.chat_id_, "", 0, "*???| user *"..matches[2].."*åæ áíÓ Öãä ÇáãßÊæãíä????*", 0, "md")
        end
     end
data[tostring(chat)]['is_silent_users'][tostring(matches[2])] = nil
    save_data(_config.moderation.data, data)
   if not lang then
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* removed from silent users list_", 0, "md")
  else
 return tdcli.sendMessage(msg.chat_id_, msg.id_, 0, "*???| user *"..matches[2].."* Êã İÊÍ ÇáßÊã Úäå????*", 0, "md")
      end
   end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="İÊÍ ÇáßÊã"})
      end
   end
		if matches[1]:lower() == 'ÇãÓÍ' and is_owner(msg) then
			if matches[2] == 'ÇáÍÙæÑíä' then
				if next(data[tostring(chat)]['banned']) == nil then
     if not lang then
					return "_No_ *banned* _users in this group_"
   else
					return "*ŞÇÆãÉ ÇáÍÙÑ İÇÑÛå??*"
              end
				end
				for k,v in pairs(data[tostring(chat)]['banned']) do
					data[tostring(chat)]['banned'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
     if not lang then
				return "_All_ *banned* _users has been unbanned_"
    else
				return "*Êã ãÓÍ ŞÇÆãÉ ÇáÍÙÑ??*"
           end
			end
			if matches[2] == 'ÇáãßÊæãíä' then
				if next(data[tostring(chat)]['is_silent_users']) == nil then
        if not lang then
					return "_No_ *silent* _users in this group_"
   else
					return "*ŞÇÆãÉ ÇáãßÊæãíä İÇÑÛå??*"
             end
				end
				for k,v in pairs(data[tostring(chat)]['is_silent_users']) do
					data[tostring(chat)]['is_silent_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				    end
       if not lang then
				return "*Silent list* _has been cleaned_"
   else
				return "*Êã ãÓÍ ŞÇÆãÉ ÇáãßÊæãíä??*"
               end
			    end
        end
		if matches[1]:lower() == 'ÇãÓÍ' and is_sudo(msg) then
			if matches[2] == 'gbans' then
				if next(data['gban_users']) == nil then
    if not lang then
					return "_No_ *globally banned* _users available_"
   else
					return "*ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã İÇÑÛå??*"
             end
				end
				for k,v in pairs(data['gban_users']) do
					data['gban_users'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
      if not lang then
				return "_All_ *globally banned* _users has been unbanned_"
   else
				return "*Êã ãÓÍ ŞÇÆãÉ ÇáÍÙÑ ÇáÚÇã??*"
          end
			end
     end
if matches[1] == "ÇáÍÙÑ ÇáÚÇã" and is_admin(msg) then
  return gbanned_list(msg)
 end
if matches[1] == "ŞÇÆãÉ ÇáÇÓßÇÊ" and is_mod(msg) then
  return silent_users_list(chat)
 end
if matches[1] == "ŞÇÆãÉ ÇáÍÙÑ" and is_mod(msg) then
  return banned_list(chat)
 end
end
return {
	patterns = {
"^(ÍÙÑ ÚÇã)$",
"^(ÍÙÑ ÚÇã) (.*)$",
"^(İÊÍ ÚÇã)$",
"^(İÊÍ ÚÇã) (.*)$",
"^(ÇáÍÙÑ ÇáÚÇã)$",
"^(ÍÙÑ)$",
"^(ÍÙÑ) (.*)$",
"^(ÇáÛÇÁ ÇáÍÙÑ)$",
"^(ÇáÛÇÁ ÇáÍÙÑ) (.*)$",
"^(ŞÇÆãÉ ÇáÍÙÑ)$",
"^(ÇßÊã)$",
"^(ÇßÊã) (.*)$",
"^(ÇáãßÊæãíä)$",
"^(İÊÍ ÇáßÊã) (.*)$",
"^(ŞÇÆãÉ ÇáÇÓßÇÊ)$",
"^(ÇØÑÏ)$",
"^(ÇØÑÏ) (.*)$",
"^(ÇãÓÍ Çáßá)$",
"^(ÇãÓÍ Çáßá) (.*)$",
"^(ÇãÓÍ) (.*)$",

},
run = run,
pre_process = pre_process
}

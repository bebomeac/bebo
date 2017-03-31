do

local function run(msg, matches)
if matches[1]=="ÇÍÈß" and is_sudo(msg) then 
return  "æÂäÜí ?Üã ÇÍÈÜß ãØÜæÑí ¦ ????Á"
elseif matches[1]=="åáæ" then 
return  "åÜÜáÄ?ÄÇÊ ÍíÜÇÊÜí ????"
elseif matches[1]=="ÇáÓáÇã Úáíßã" then 
return  "æÚÜáíÜßã ÇáÜÜÓÜáÇã ????"
elseif matches[1]=="ÇáÍãÏááå" or matches[1]== "ÇáÍãÏ ááå" then 
return  " ÚÓÜÜÇåÇ Ïæ{ãÜæ íÜæã}æã? ??'Á "
elseif matches[1]=="ãÑÍÈÇ" then 
return  " ãÜÑÇÍÜ? íÇ?ÜáÇ? ????'Á "
elseif matches[1]=="åÇí" then 
return  " åÜÇíÜÇÊ íÜÑæÍÜí?????'Á "
elseif matches[1]=="Ôáæäßã" then 
return  " ÇäÜí ÇáÍãÜÏ ááÜÀ'å ÔÜæİ ÇáÈŞíÜÀ'å???'Á "
elseif matches[1]=="ÈæÊ" then 
return  " ÊİÖÜá íÇáÚãÜÀ'É ÚíÜäí????'Á "
elseif matches[1]=="åáÇæ" then 
return  " åÜÜáÄ?ÄÇÊ ÍíÜÇÊÜí ???? "
elseif matches[1]=="Õáæ Ú ÇáäÈí" then 
return  " Çááåã Õáí æÓáã Úáì ÓíÏäÇ ãÍãÏ ???? "
elseif matches[1]=="ÓáÇã" then 
return  " ÓÜáÇãÇÊ ÍÜÈ????? "
elseif matches[1]=="ÌÇæ" then 
return  " ÇááÜÀ'å æíÜÇß ÍíÜÇÊí?????Á "
elseif matches[1]=="ÈÇí" then 
return  " ÇááÜÀ'å æíÜÇß ÍíÜÇÊí?????Á "
elseif matches[1]=="ÇßÑåß" then 
return  " ÜÜÓ ÇäÜí ÇÍÈÜ˜?????Á "
elseif matches[1]=="ÊßÑåäí" then 
return  " ØÜÈÚÇğ ãÜÇ ÇßÜÑåß ¦ ???'Á "
elseif matches[1]=="ÇÚÔŞß" then 
return  " ÇÄæÄİ Ô?ÜÇá ÌİÜÇİ ¦ ????'Á "
elseif matches[1]=="ÔÎÈÇÑßã" then 
return  " ÇäÜí ÇáÍãÜÏ ááÜÀ'å ÔÜæİ ÇáÈŞíÜÀ'å???'Á "
elseif matches[1]=="ÇÑíÏ ÈæÊ" then 
return  " ÑÇÓÜá ÇáãØÜæÑ ¦ ????Á \n??¦ ÇáãØÜæÑ : @AHMAD_X7 "
elseif matches[1]=="ÊãÇã" then 
return  " ÚÓÜÜÇåÇ Ïæ{ãÜæ íÜæã}æã???'Á  "
else
return  "æÂäÜí ?Üã ÇÍÈÜß íÇÚíÜä ÚíÜäí ¦ ????Á"
end

end

return {
  patterns = {
  "^(ÇÍÈß)$",
"^(åáæ)$",
"^(ÇáÍãÏááå)$",
"^(ÇáÍãÏ ááå)$",
"^(ãÑÍÈÇ)$",
"^(åÇí)$",
"^(Ôáæäßã)$",
"^(ÈæÊ)$",
"^(åáÇæ)$",
"^(Õáæ Ú ÇáäÈí)$",
"^(ÓáÇã)$",
"^(ÌÇæ)$",
"^(ÈÇí)$",
"^(ÇßÑåß)$",
"^(ÊßÑåäí)$",
"^(ÇÚÔŞß)$",
"^(ÔÎÈÇÑßã)$",
"^(ÇÑíÏ ÈæÊ)$",
"^(ÊãÇã)$",
    },
  run = run
}
end
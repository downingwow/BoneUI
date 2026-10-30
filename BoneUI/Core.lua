local B=CreateFrame('Frame','BoneUIBackportCore',UIParent)
BoneUIBackport=B
B.modules={};B.version='1.1.0'
function B:Register(name,fn) self.modules[#self.modules+1]={name,fn} end
function B:Log(s) DEFAULT_CHAT_FRAME:AddMessage('|cff0cd29fBoneUI|r '..tostring(s)) end
function B:Init()
 BoneUIBackportDB=BoneUIBackportDB or {}
 local d=BoneUIBackportDB
 if d.enabled==nil then d.enabled=true end
 d.frames=d.frames or {enabled=true,player=true,target=true,focus=true}
 d.cast=d.cast or {enabled=true}
 d.actions=d.actions or {enabled=false}
 d.positions=d.positions or {}
 for _,m in ipairs(self.modules) do
  local ok,err=pcall(m[2],self,d)
  if not ok then self:Log('Module '..m[1]..' failed: '..tostring(err)) end
 end
 self:Log('v'..self.version..' loaded. Type /bui to open settings.')
end
B:RegisterEvent('ADDON_LOADED')
B:SetScript('OnEvent',function(self,event,name) if name=='BoneUI' then self:UnregisterEvent('ADDON_LOADED');self:Init() end end)
SLASH_BONEUI1='/bui';SLASH_BONEUI2='/boneui'
SlashCmdList.BONEUI=function(msg)
 if msg=='reset' then BoneUIBackportDB=nil;ReloadUI();return end
 if BoneUIBackport and BoneUIBackport.ToggleOptions then BoneUIBackport:ToggleOptions() else DEFAULT_CHAT_FRAME:AddMessage('BoneUI settings not initialized') end
end
